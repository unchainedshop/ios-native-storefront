//
//  ContentView.swift
//  ios-native-storefront
//
//  Created by Pascal Kaufmann on 13.04.20.
//  Copyright © 2020 Pascal Kaufmann. All rights reserved.
//

import SwiftUI
import StoreKit

struct SubscribeButton : View {
    var product : SKProduct
    var userId: String

    var body: some View {
        return Button(action: {
            StoreObserver.shared.buy(self.product, userId: self.userId)
        }) {
            return Text("Subscribe")
                .foregroundColor(Color.white)
                .padding(.all, 10.0)
        }.background(Color.black)
    }
}

struct ContentView: View {
    @ObservedObject var fetcher = ProductFetcher()
    @ObservedObject var userFetcher = MeFetcher()

    
    var body: some View {
        VStack {
            List(fetcher.products) { product in
                VStack (alignment: .leading) {
                    Text(product.unchainedProduct.texts?.title ?? "")
                    Text(product.unchainedProduct.texts?.subtitle ?? "")
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                    if (product.storeKitProduct != nil) {
                        SubscribeButton(product: product.storeKitProduct!, userId: self.userFetcher.me?._id ?? "admin")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubscribeButton(product: SKProduct(), userId: "admin")
    }
}
