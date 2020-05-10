// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
      }
    }
    """

  public let operationName: String = "SimpleProductList"

  public let operationIdentifier: String? = "f0c290b0188d38182187cc21371a9d83a33ae60ed9ca796931788a5d3a9a5092"

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
          variants: ["SimpleProduct": AsSimpleProduct.selections],
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

      public static func makePlanProduct(_id: GraphQLID, media: [Medium], texts: Text? = nil) -> Product {
        return Product(unsafeResultMap: ["__typename": "PlanProduct", "_id": _id, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "texts": texts.flatMap { (value: Text) -> ResultMap in value.resultMap }])
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
    }
  }
}
