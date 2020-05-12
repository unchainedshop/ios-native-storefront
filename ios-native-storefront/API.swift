// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AddSubscriptionToCartMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation addSubscriptionToCart($productId: ID!, $paymentProviderId: ID!) {
      emptyCart {
        __typename
        _id
      }
      addCartProduct(productId: $productId) {
        __typename
        _id
      }
      updateCart(paymentProviderId: $paymentProviderId) {
        __typename
        _id
      }
    }
    """

  public let operationName: String = "addSubscriptionToCart"

  public let operationIdentifier: String? = "5f90782441ef7d44a818ccc191d15da175634e1bbcf02c27a0abbee52787a5ed"

  public var productId: GraphQLID
  public var paymentProviderId: GraphQLID

  public init(productId: GraphQLID, paymentProviderId: GraphQLID) {
    self.productId = productId
    self.paymentProviderId = paymentProviderId
  }

  public var variables: GraphQLMap? {
    return ["productId": productId, "paymentProviderId": paymentProviderId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("emptyCart", type: .object(EmptyCart.selections)),
      GraphQLField("addCartProduct", arguments: ["productId": GraphQLVariable("productId")], type: .nonNull(.object(AddCartProduct.selections))),
      GraphQLField("updateCart", arguments: ["paymentProviderId": GraphQLVariable("paymentProviderId")], type: .nonNull(.object(UpdateCart.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(emptyCart: EmptyCart? = nil, addCartProduct: AddCartProduct, updateCart: UpdateCart) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "emptyCart": emptyCart.flatMap { (value: EmptyCart) -> ResultMap in value.resultMap }, "addCartProduct": addCartProduct.resultMap, "updateCart": updateCart.resultMap])
    }

    /// Remove all items of an open order (cart) if possible
    public var emptyCart: EmptyCart? {
      get {
        return (resultMap["emptyCart"] as? ResultMap).flatMap { EmptyCart(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "emptyCart")
      }
    }

    /// Add a new item to the cart. Order gets generated with status = open (= order before checkout / cart) if necessary.
    public var addCartProduct: AddCartProduct {
      get {
        return AddCartProduct(unsafeResultMap: resultMap["addCartProduct"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addCartProduct")
      }
    }

    /// Change billing address and order contact of an open order (cart)
    public var updateCart: UpdateCart {
      get {
        return UpdateCart(unsafeResultMap: resultMap["updateCart"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateCart")
      }
    }

    public struct EmptyCart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Order", "_id": _id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }
    }

    public struct AddCartProduct: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderItem"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "OrderItem", "_id": _id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }
    }

    public struct UpdateCart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Order", "_id": _id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }
    }
  }
}

public final class CheckoutCartMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation checkoutCart($paymentContext: JSON) {
      checkoutCart(paymentContext: $paymentContext) {
        __typename
        _id
      }
    }
    """

  public let operationName: String = "checkoutCart"

  public let operationIdentifier: String? = "597fe442950b37661509c5181ab08d63cda10a49d04d2daf13a177f88acd7c61"

  public var paymentContext: String?

  public init(paymentContext: String? = nil) {
    self.paymentContext = paymentContext
  }

  public var variables: GraphQLMap? {
    return ["paymentContext": paymentContext]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutCart", arguments: ["paymentContext": GraphQLVariable("paymentContext")], type: .nonNull(.object(CheckoutCart.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutCart: CheckoutCart) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "checkoutCart": checkoutCart.resultMap])
    }

    /// Process the checkout (automatically charge & deliver if possible), the cart will get
    /// transformed to an ordinary order if everything goes well.
    public var checkoutCart: CheckoutCart {
      get {
        return CheckoutCart(unsafeResultMap: resultMap["checkoutCart"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "checkoutCart")
      }
    }

    public struct CheckoutCart: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Order", "_id": _id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }
    }
  }
}

public final class LoginAsGuestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation loginAsGuest {
      loginAsGuest {
        __typename
        id
        token
        tokenExpires
      }
    }
    """

  public let operationName: String = "loginAsGuest"

  public let operationIdentifier: String? = "7a769dadd5eb36a8828dfeadedee7dd5f2cfba6c8f60f217cfa3a18fc1bffd90"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("loginAsGuest", type: .object(LoginAsGuest.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loginAsGuest: LoginAsGuest? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "loginAsGuest": loginAsGuest.flatMap { (value: LoginAsGuest) -> ResultMap in value.resultMap }])
    }

    /// Login as Guest User (creates an anonymous user and returns logged in token)
    public var loginAsGuest: LoginAsGuest? {
      get {
        return (resultMap["loginAsGuest"] as? ResultMap).flatMap { LoginAsGuest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "loginAsGuest")
      }
    }

    public struct LoginAsGuest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LoginMethodResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
        GraphQLField("tokenExpires", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, token: String, tokenExpires: String) {
        self.init(unsafeResultMap: ["__typename": "LoginMethodResponse", "id": id, "token": token, "tokenExpires": tokenExpires])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Id of the user logged in user
      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Token of the connection
      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      /// Expiration date for the token
      public var tokenExpires: String {
        get {
          return resultMap["tokenExpires"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "tokenExpires")
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        _id
        username
        primaryEmail {
          __typename
          address
        }
      }
    }
    """

  public let operationName: String = "Me"

  public let operationIdentifier: String? = "b61eaebf35c92333ab7d71a896c722c76ef04a7c127e853057c380b560f057b9"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .object(Me.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    /// Currently logged in user
    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("primaryEmail", type: .object(PrimaryEmail.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: GraphQLID, username: String? = nil, primaryEmail: PrimaryEmail? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "_id": _id, "username": username, "primaryEmail": primaryEmail.flatMap { (value: PrimaryEmail) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var username: String? {
        get {
          return resultMap["username"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var primaryEmail: PrimaryEmail? {
        get {
          return (resultMap["primaryEmail"] as? ResultMap).flatMap { PrimaryEmail(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "primaryEmail")
        }
      }

      public struct PrimaryEmail: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserEmail"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "UserEmail", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }
    }
  }
}

public final class SimpleProductListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SimpleProductList($limit: Int, $offset: Int) {
      products(limit: $limit, offset: $offset) {
        __typename
        _id
        media {
          __typename
          _id
          file {
            __typename
            _id
            url
          }
        }
        texts {
          __typename
          _id
          slug
          title
          subtitle
          description
        }
        ... on SimpleProduct {
          simulatedPrice {
            __typename
            _id
            price {
              __typename
              amount
              currency
            }
          }
        }
        ... on PlanProduct {
          simulatedPrice {
            __typename
            _id
            price {
              __typename
              amount
              currency
            }
          }
        }
      }
    }
    """

  public let operationName: String = "SimpleProductList"

  public let operationIdentifier: String? = "12cdfd9a86038bc1e0c5d066c434dae991b03bc0da8cd7c82f9fc47b3cca89eb"

  public var limit: Int?
  public var offset: Int?

  public init(limit: Int? = nil, offset: Int? = nil) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("products", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Product.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: [Product]) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.map { (value: Product) -> ResultMap in value.resultMap }])
    }

    /// Simple list of published products filtered either by tags or explicit slugs
    /// If a slug is provided, limit and offset don't have any effect on the result
    public var products: [Product] {
      get {
        return (resultMap["products"] as! [ResultMap]).map { (value: ResultMap) -> Product in Product(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Product) -> ResultMap in value.resultMap }, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PlanProduct", "BundleProduct", "ConfigurableProduct", "SimpleProduct"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["SimpleProduct": AsSimpleProduct.selections, "PlanProduct": AsPlanProduct.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("media", type: .nonNull(.list(.nonNull(.object(Medium.selections))))),
            GraphQLField("texts", type: .object(Text.selections)),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeBundleProduct(_id: GraphQLID, media: [Medium], texts: Text? = nil) -> Product {
        return Product(unsafeResultMap: ["__typename": "BundleProduct", "_id": _id, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: Text) -> ResultMap in value.resultMap }])
      }

      public static func makeConfigurableProduct(_id: GraphQLID, media: [Medium], texts: Text? = nil) -> Product {
        return Product(unsafeResultMap: ["__typename": "ConfigurableProduct", "_id": _id, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: Text) -> ResultMap in value.resultMap }])
      }

      public static func makeSimpleProduct(_id: GraphQLID, media: [AsSimpleProduct.Medium], texts: AsSimpleProduct.Text? = nil, simulatedPrice: AsSimpleProduct.SimulatedPrice? = nil) -> Product {
        return Product(unsafeResultMap: ["__typename": "SimpleProduct", "_id": _id, "media": media.map { (value: AsSimpleProduct.Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: AsSimpleProduct.Text) -> ResultMap in value.resultMap }, "simulatedPrice": simulatedPrice.flatMap { (value: AsSimpleProduct.SimulatedPrice) -> ResultMap in value.resultMap }])
      }

      public static func makePlanProduct(_id: GraphQLID, media: [AsPlanProduct.Medium], texts: AsPlanProduct.Text? = nil, simulatedPrice: AsPlanProduct.SimulatedPrice? = nil) -> Product {
        return Product(unsafeResultMap: ["__typename": "PlanProduct", "_id": _id, "media": media.map { (value: AsPlanProduct.Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: AsPlanProduct.Text) -> ResultMap in value.resultMap }, "simulatedPrice": simulatedPrice.flatMap { (value: AsPlanProduct.SimulatedPrice) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var media: [Medium] {
        get {
          return (resultMap["media"] as! [ResultMap]).map { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Medium) -> ResultMap in value.resultMap }, forKey: "media")
        }
      }

      public var texts: Text? {
        get {
          return (resultMap["texts"] as? ResultMap).flatMap { Text(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "texts")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductMedia"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("file", type: .nonNull(.object(File.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, file: File) {
          self.init(unsafeResultMap: ["__typename": "ProductMedia", "_id": _id, "file": file.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var file: File {
          get {
            return File(unsafeResultMap: resultMap["file"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "file")
          }
        }

        public struct File: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, url: String) {
            self.init(unsafeResultMap: ["__typename": "Media", "_id": _id, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }

      public struct Text: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductTexts"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("slug", type: .scalar(String.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, slug: String? = nil, title: String? = nil, subtitle: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductTexts", "_id": _id, "slug": slug, "title": title, "subtitle": subtitle, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var slug: String? {
          get {
            return resultMap["slug"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "slug")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var subtitle: String? {
          get {
            return resultMap["subtitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subtitle")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public var asSimpleProduct: AsSimpleProduct? {
        get {
          if !AsSimpleProduct.possibleTypes.contains(__typename) { return nil }
          return AsSimpleProduct(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsSimpleProduct: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SimpleProduct"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("media", type: .nonNull(.list(.nonNull(.object(Medium.selections))))),
          GraphQLField("texts", type: .object(Text.selections)),
          GraphQLField("simulatedPrice", type: .object(SimulatedPrice.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, media: [Medium], texts: Text? = nil, simulatedPrice: SimulatedPrice? = nil) {
          self.init(unsafeResultMap: ["__typename": "SimpleProduct", "_id": _id, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: Text) -> ResultMap in value.resultMap }, "simulatedPrice": simulatedPrice.flatMap { (value: SimulatedPrice) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var media: [Medium] {
          get {
            return (resultMap["media"] as! [ResultMap]).map { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Medium) -> ResultMap in value.resultMap }, forKey: "media")
          }
        }

        public var texts: Text? {
          get {
            return (resultMap["texts"] as? ResultMap).flatMap { Text(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "texts")
          }
        }

        public var simulatedPrice: SimulatedPrice? {
          get {
            return (resultMap["simulatedPrice"] as? ResultMap).flatMap { SimulatedPrice(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "simulatedPrice")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductMedia"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("file", type: .nonNull(.object(File.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, file: File) {
            self.init(unsafeResultMap: ["__typename": "ProductMedia", "_id": _id, "file": file.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var file: File {
            get {
              return File(unsafeResultMap: resultMap["file"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "file")
            }
          }

          public struct File: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(_id: GraphQLID, url: String) {
              self.init(unsafeResultMap: ["__typename": "Media", "_id": _id, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var _id: GraphQLID {
              get {
                return resultMap["_id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "_id")
              }
            }

            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }
        }

        public struct Text: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductTexts"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("slug", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("subtitle", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, slug: String? = nil, title: String? = nil, subtitle: String? = nil, description: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ProductTexts", "_id": _id, "slug": slug, "title": title, "subtitle": subtitle, "description": description])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var slug: String? {
            get {
              return resultMap["slug"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "slug")
            }
          }

          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var subtitle: String? {
            get {
              return resultMap["subtitle"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "subtitle")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }
        }

        public struct SimulatedPrice: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductPrice"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("price", type: .nonNull(.object(Price.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, price: Price) {
            self.init(unsafeResultMap: ["__typename": "ProductPrice", "_id": _id, "price": price.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var price: Price {
            get {
              return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "price")
            }
          }

          public struct Price: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Int, currency: String) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "currency": currency])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var amount: Int {
              get {
                return resultMap["amount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }

            public var currency: String {
              get {
                return resultMap["currency"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "currency")
              }
            }
          }
        }
      }

      public var asPlanProduct: AsPlanProduct? {
        get {
          if !AsPlanProduct.possibleTypes.contains(__typename) { return nil }
          return AsPlanProduct(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsPlanProduct: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PlanProduct"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("media", type: .nonNull(.list(.nonNull(.object(Medium.selections))))),
          GraphQLField("texts", type: .object(Text.selections)),
          GraphQLField("simulatedPrice", type: .object(SimulatedPrice.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: GraphQLID, media: [Medium], texts: Text? = nil, simulatedPrice: SimulatedPrice? = nil) {
          self.init(unsafeResultMap: ["__typename": "PlanProduct", "_id": _id, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: Text) -> ResultMap in value.resultMap }, "simulatedPrice": simulatedPrice.flatMap { (value: SimulatedPrice) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var media: [Medium] {
          get {
            return (resultMap["media"] as! [ResultMap]).map { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Medium) -> ResultMap in value.resultMap }, forKey: "media")
          }
        }

        public var texts: Text? {
          get {
            return (resultMap["texts"] as? ResultMap).flatMap { Text(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "texts")
          }
        }

        public var simulatedPrice: SimulatedPrice? {
          get {
            return (resultMap["simulatedPrice"] as? ResultMap).flatMap { SimulatedPrice(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "simulatedPrice")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductMedia"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("file", type: .nonNull(.object(File.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, file: File) {
            self.init(unsafeResultMap: ["__typename": "ProductMedia", "_id": _id, "file": file.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var file: File {
            get {
              return File(unsafeResultMap: resultMap["file"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "file")
            }
          }

          public struct File: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(_id: GraphQLID, url: String) {
              self.init(unsafeResultMap: ["__typename": "Media", "_id": _id, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var _id: GraphQLID {
              get {
                return resultMap["_id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "_id")
              }
            }

            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }
        }

        public struct Text: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductTexts"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("slug", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("subtitle", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, slug: String? = nil, title: String? = nil, subtitle: String? = nil, description: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ProductTexts", "_id": _id, "slug": slug, "title": title, "subtitle": subtitle, "description": description])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var slug: String? {
            get {
              return resultMap["slug"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "slug")
            }
          }

          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var subtitle: String? {
            get {
              return resultMap["subtitle"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "subtitle")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }
        }

        public struct SimulatedPrice: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductPrice"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("price", type: .nonNull(.object(Price.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, price: Price) {
            self.init(unsafeResultMap: ["__typename": "ProductPrice", "_id": _id, "price": price.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
            }
          }

          public var price: Price {
            get {
              return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "price")
            }
          }

          public struct Price: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Int, currency: String) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "currency": currency])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var amount: Int {
              get {
                return resultMap["amount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }

            public var currency: String {
              get {
                return resultMap["currency"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "currency")
              }
            }
          }
        }
      }
    }
  }
}
