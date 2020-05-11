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

public class MeFetcher: ObservableObject {
    @Published var me : MeQuery.Data.Me? = nil
    
    var watcher: GraphQLQueryWatcher<MeQuery>? = nil
    
    init(){
        self.watcher = Network.shared.apollo.watch(query: MeQuery(), cachePolicy: .returnCacheDataAndFetch) { result in
          switch result {
          case .success(let graphQLResult):
            guard let me = graphQLResult.data?.me else { return }
            self.me = me
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    deinit {
        self.watcher?.cancel()
    }
}
