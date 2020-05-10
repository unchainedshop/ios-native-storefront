//
//  ContentView.swift
//  ios-native-storefront
//
//  Created by Pascal Kaufmann on 13.04.20.
//  Copyright © 2020 Pascal Kaufmann. All rights reserved.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @ObservedObject var fetcher = ProductFetcher()
    
    
    var body: some View {
        VStack {
            List(fetcher.products) { product in
                VStack (alignment: .leading) {
                    Text(product.texts?.title ?? "")
                    Text(product.texts?.subtitle ?? "")
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
