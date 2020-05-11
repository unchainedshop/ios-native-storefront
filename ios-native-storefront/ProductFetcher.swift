//
//  ProductFetcher.swift
//  ios-native-storefront
//
//  Created by Pascal Kaufmann on 13.04.20.
//  Copyright © 2020 Pascal Kaufmann. All rights reserved.
//

import Foundation
import Apollo
import StoreKit

extension SimpleProductListQuery.Data.Product: Comparable, Identifiable {
    public typealias ID = String

    public var id: ID {
        return self._id
    }
    
    public static func < (lhs: SimpleProductListQuery.Data.Product, rhs: SimpleProductListQuery.Data.Product) -> Bool {
        return lhs._id < rhs._id
    }
    
    public static func == (lhs: SimpleProductListQuery.Data.Product, rhs: SimpleProductListQuery.Data.Product) -> Bool {
        return lhs._id == rhs._id
    }
}

struct Product: Comparable, Identifiable {
    public typealias ID = String

    static func < (lhs: Product, rhs: Product) -> Bool {
        return lhs.id < rhs.id
    }
    
    public var id: ID {
        return unchainedProduct._id
    }
    let storeKitProduct: SKProduct?
    let unchainedProduct: SimpleProductListQuery.Data.Product
}

public class ProductFetcher: ObservableObject, StoreManagerDelegate {
    @Published var products = [Product]()
    var unchainedProducts = [SimpleProductListQuery.Data.Product]()
    var storeKitProducts = Set<SKProduct>()
    
    var watcher: GraphQLQueryWatcher<SimpleProductListQuery>? = nil
    
    init(){
        StoreManager.shared.delegate = self
        self.watcher = Network.shared.apollo.watch(query: SimpleProductListQuery(limit: 0, offset: 0), cachePolicy: .returnCacheDataAndFetch) { result in
          switch result {
          case .success(let graphQLResult):
            guard let products = graphQLResult.data?.products else { return }
            self.unchainedProducts = products
            let productIds = products.map { product in return product.id }
            StoreManager.shared.startProductRequest(with: productIds)
            self.combineProducts()
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    private func combineProducts() {
        products = unchainedProducts.map({ unchainedProduct in
            let storeKitProduct = storeKitProducts.first(where: { storeKitProduct in
                return storeKitProduct.productIdentifier == unchainedProduct.id
            })
            return Product(storeKitProduct: storeKitProduct, unchainedProduct: unchainedProduct)
        })
    }
    
    func storeManagerDidReceiveMessage(_ message: String) {
        print(message)
    }
    
    func storeManagerDidReceiveResponse(_ response: [Section]) {
        let products = response.flatMap { section -> [SKProduct] in
            let mappedProducts = section.elements.compactMap { product in
                return product as? SKProduct
            }
            return mappedProducts
        }
        storeKitProducts.formUnion(products)
        combineProducts()
    }
    
    deinit {
        self.watcher?.cancel()
    }
}
