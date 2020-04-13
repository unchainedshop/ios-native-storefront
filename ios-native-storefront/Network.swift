//
//  Network.swift
//  ios-native-storefront
//
//  Created by Pascal Kaufmann on 13.04.20.
//  Copyright © 2020 Pascal Kaufmann. All rights reserved.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://engine.unchained.shop/graphql")!)
}
