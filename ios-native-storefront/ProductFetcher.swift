//
//  ProductFetcher.swift
//  ios-native-storefront
//
//  Created by Pascal Kaufmann on 13.04.20.
//  Copyright © 2020 Pascal Kaufmann. All rights reserved.
//

import Foundation
import Apollo

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

public class ProductFetcher: ObservableObject {
    @Published var products = [SimpleProductListQuery.Data.Product]()
    var watcher: GraphQLQueryWatcher<SimpleProductListQuery>? = nil
    
    init(){
        self.watcher = Network.shared.apollo.watch(query: SimpleProductListQuery(limit: 0, offset: 0), cachePolicy: .returnCacheDataAndFetch) { result in
          switch result {
          case .success(let graphQLResult):
            guard let products = graphQLResult.data?.products else { return }
            self.products = products
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    deinit {
        self.watcher?.cancel()
    }
}
