//
//  Network.swift
//  ios-native-storefront
//
//  Created by Pascal Kaufmann on 13.04.20.
//  Copyright © 2020 Pascal Kaufmann. All rights reserved.
//

import Foundation
import Apollo
import KeychainSwift

class Network : HTTPNetworkTransportPreflightDelegate {
    private lazy var networkTransport: HTTPNetworkTransport = {
      let transport = HTTPNetworkTransport(url: URL(string: "https://engine.unchained.shop/graphql")!)
      transport.delegate = self
      return transport
    }()
    
    private let keychain = KeychainSwift()
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
                              
          // Get the existing headers, or create new ones if they're nil
          var headers = request.allHTTPHeaderFields ?? [String: String]()

          // Add any new headers you need
        if let token = keychain.get(LoginCredentials.tokenKey) {
            headers["Authorization"] = "Bearer \(token)"
        }
        print(headers)
        
          // Re-assign the updated headers to the request.
          request.allHTTPHeaderFields = headers
    }
    
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(networkTransport: networkTransport)
    
    public func isLoggedIn() -> Bool {
      return keychain.get(LoginCredentials.tokenKey) != nil
    }
    
    public func login() -> Cancellable {
        return apollo.perform(mutation: LoginAsGuestMutation()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
              if let login = graphQLResult.data?.loginAsGuest {
                self?.keychain.set(login.token, forKey: LoginCredentials.tokenKey)
                self?.keychain.set(login.tokenExpires, forKey: LoginCredentials.tokenExpiresKey)
                self?.apollo.clearCache()
              }

              if let errors = graphQLResult.errors {
                print("Errors from server: \(errors)")
              }
            case .failure(let error):
              print("Error: \(error)")
            }
        }
    }
}
