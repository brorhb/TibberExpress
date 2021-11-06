// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class OverviewQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Overview {
      viewer {
        __typename
        homes {
          __typename
          timeZone
          address {
            __typename
            address1
            postalCode
            city
          }
          owner {
            __typename
            firstName
            lastName
            contactInfo {
              __typename
              email
              mobile
            }
          }
          consumption(resolution: HOURLY, last: 10) {
            __typename
            nodes {
              __typename
              from
              to
              cost
              unitPrice
              unitPriceVAT
              consumption
              consumptionUnit
            }
          }
          currentSubscription {
            __typename
            priceInfo {
              __typename
              current {
                __typename
                total
                energy
                tax
                startsAt
              }
              today {
                __typename
                total
                energy
                tax
                startsAt
              }
              tomorrow {
                __typename
                total
                energy
                tax
                startsAt
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Overview"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// This contains data about the logged-in user
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Viewer"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("homes", type: .nonNull(.list(.object(Home.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(homes: [Home?]) {
        self.init(unsafeResultMap: ["__typename": "Viewer", "homes": homes.map { (value: Home?) -> ResultMap? in value.flatMap { (value: Home) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// All homes visible to the logged-in user
      public var homes: [Home?] {
        get {
          return (resultMap["homes"] as! [ResultMap?]).map { (value: ResultMap?) -> Home? in value.flatMap { (value: ResultMap) -> Home in Home(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Home?) -> ResultMap? in value.flatMap { (value: Home) -> ResultMap in value.resultMap } }, forKey: "homes")
        }
      }

      public struct Home: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Home"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("timeZone", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .object(Address.selections)),
            GraphQLField("owner", type: .object(Owner.selections)),
            GraphQLField("consumption", arguments: ["resolution": "HOURLY", "last": 10], type: .object(Consumption.selections)),
            GraphQLField("currentSubscription", type: .object(CurrentSubscription.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(timeZone: String, address: Address? = nil, owner: Owner? = nil, consumption: Consumption? = nil, currentSubscription: CurrentSubscription? = nil) {
          self.init(unsafeResultMap: ["__typename": "Home", "timeZone": timeZone, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }, "owner": owner.flatMap { (value: Owner) -> ResultMap in value.resultMap }, "consumption": consumption.flatMap { (value: Consumption) -> ResultMap in value.resultMap }, "currentSubscription": currentSubscription.flatMap { (value: CurrentSubscription) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The time zone the home resides in
        public var timeZone: String {
          get {
            return resultMap["timeZone"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "timeZone")
          }
        }

        public var address: Address? {
          get {
            return (resultMap["address"] as? ResultMap).flatMap { Address(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "address")
          }
        }

        /// The registered owner of the house
        public var owner: Owner? {
          get {
            return (resultMap["owner"] as? ResultMap).flatMap { Owner(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "owner")
          }
        }

        /// Consumption connection
        public var consumption: Consumption? {
          get {
            return (resultMap["consumption"] as? ResultMap).flatMap { Consumption(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "consumption")
          }
        }

        /// The current/latest subscription related to the home
        public var currentSubscription: CurrentSubscription? {
          get {
            return (resultMap["currentSubscription"] as? ResultMap).flatMap { CurrentSubscription(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "currentSubscription")
          }
        }

        public struct Address: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Address"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address1", type: .scalar(String.self)),
              GraphQLField("postalCode", type: .scalar(String.self)),
              GraphQLField("city", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address1: String? = nil, postalCode: String? = nil, city: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Address", "address1": address1, "postalCode": postalCode, "city": city])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var address1: String? {
            get {
              return resultMap["address1"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address1")
            }
          }

          public var postalCode: String? {
            get {
              return resultMap["postalCode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "postalCode")
            }
          }

          public var city: String? {
            get {
              return resultMap["city"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "city")
            }
          }
        }

        public struct Owner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LegalEntity"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("firstName", type: .scalar(String.self)),
              GraphQLField("lastName", type: .scalar(String.self)),
              GraphQLField("contactInfo", type: .object(ContactInfo.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(firstName: String? = nil, lastName: String? = nil, contactInfo: ContactInfo? = nil) {
            self.init(unsafeResultMap: ["__typename": "LegalEntity", "firstName": firstName, "lastName": lastName, "contactInfo": contactInfo.flatMap { (value: ContactInfo) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// First/Christian name of the entity
          public var firstName: String? {
            get {
              return resultMap["firstName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          /// Last name of the entity
          public var lastName: String? {
            get {
              return resultMap["lastName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }

          /// Contact information of the entity
          public var contactInfo: ContactInfo? {
            get {
              return (resultMap["contactInfo"] as? ResultMap).flatMap { ContactInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "contactInfo")
            }
          }

          public struct ContactInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ContactInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("email", type: .scalar(String.self)),
                GraphQLField("mobile", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(email: String? = nil, mobile: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "ContactInfo", "email": email, "mobile": mobile])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The email of the corresponding entity
            public var email: String? {
              get {
                return resultMap["email"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "email")
              }
            }

            /// The mobile phone no of the corresponding entity
            public var mobile: String? {
              get {
                return resultMap["mobile"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mobile")
              }
            }
          }
        }

        public struct Consumption: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["HomeConsumptionConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "HomeConsumptionConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Consumption"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("from", type: .nonNull(.scalar(String.self))),
                GraphQLField("to", type: .nonNull(.scalar(String.self))),
                GraphQLField("cost", type: .scalar(Double.self)),
                GraphQLField("unitPrice", type: .scalar(Double.self)),
                GraphQLField("unitPriceVAT", type: .scalar(Double.self)),
                GraphQLField("consumption", type: .scalar(Double.self)),
                GraphQLField("consumptionUnit", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(from: String, to: String, cost: Double? = nil, unitPrice: Double? = nil, unitPriceVat: Double? = nil, consumption: Double? = nil, consumptionUnit: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Consumption", "from": from, "to": to, "cost": cost, "unitPrice": unitPrice, "unitPriceVAT": unitPriceVat, "consumption": consumption, "consumptionUnit": consumptionUnit])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var from: String {
              get {
                return resultMap["from"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "from")
              }
            }

            public var to: String {
              get {
                return resultMap["to"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "to")
              }
            }

            public var cost: Double? {
              get {
                return resultMap["cost"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "cost")
              }
            }

            public var unitPrice: Double? {
              get {
                return resultMap["unitPrice"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "unitPrice")
              }
            }

            public var unitPriceVat: Double? {
              get {
                return resultMap["unitPriceVAT"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "unitPriceVAT")
              }
            }

            /// kWh consumed
            public var consumption: Double? {
              get {
                return resultMap["consumption"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "consumption")
              }
            }

            public var consumptionUnit: String? {
              get {
                return resultMap["consumptionUnit"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "consumptionUnit")
              }
            }
          }
        }

        public struct CurrentSubscription: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Subscription"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("priceInfo", type: .object(PriceInfo.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(priceInfo: PriceInfo? = nil) {
            self.init(unsafeResultMap: ["__typename": "Subscription", "priceInfo": priceInfo.flatMap { (value: PriceInfo) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Price information related to the subscription
          public var priceInfo: PriceInfo? {
            get {
              return (resultMap["priceInfo"] as? ResultMap).flatMap { PriceInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "priceInfo")
            }
          }

          public struct PriceInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PriceInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("current", type: .object(Current.selections)),
                GraphQLField("today", type: .nonNull(.list(.object(Today.selections)))),
                GraphQLField("tomorrow", type: .nonNull(.list(.object(Tomorrow.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(current: Current? = nil, today: [Today?], tomorrow: [Tomorrow?]) {
              self.init(unsafeResultMap: ["__typename": "PriceInfo", "current": current.flatMap { (value: Current) -> ResultMap in value.resultMap }, "today": today.map { (value: Today?) -> ResultMap? in value.flatMap { (value: Today) -> ResultMap in value.resultMap } }, "tomorrow": tomorrow.map { (value: Tomorrow?) -> ResultMap? in value.flatMap { (value: Tomorrow) -> ResultMap in value.resultMap } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The energy price right now
            public var current: Current? {
              get {
                return (resultMap["current"] as? ResultMap).flatMap { Current(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "current")
              }
            }

            /// The hourly prices of the current day
            public var today: [Today?] {
              get {
                return (resultMap["today"] as! [ResultMap?]).map { (value: ResultMap?) -> Today? in value.flatMap { (value: ResultMap) -> Today in Today(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Today?) -> ResultMap? in value.flatMap { (value: Today) -> ResultMap in value.resultMap } }, forKey: "today")
              }
            }

            /// The hourly prices of the upcoming day
            public var tomorrow: [Tomorrow?] {
              get {
                return (resultMap["tomorrow"] as! [ResultMap?]).map { (value: ResultMap?) -> Tomorrow? in value.flatMap { (value: ResultMap) -> Tomorrow in Tomorrow(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Tomorrow?) -> ResultMap? in value.flatMap { (value: Tomorrow) -> ResultMap in value.resultMap } }, forKey: "tomorrow")
              }
            }

            public struct Current: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Price"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("total", type: .scalar(Double.self)),
                  GraphQLField("energy", type: .scalar(Double.self)),
                  GraphQLField("tax", type: .scalar(Double.self)),
                  GraphQLField("startsAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(total: Double? = nil, energy: Double? = nil, tax: Double? = nil, startsAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Price", "total": total, "energy": energy, "tax": tax, "startsAt": startsAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The total price (energy + taxes)
              public var total: Double? {
                get {
                  return resultMap["total"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "total")
                }
              }

              /// Nordpool spot price
              public var energy: Double? {
                get {
                  return resultMap["energy"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "energy")
                }
              }

              /// The tax part of the price (guarantee of origin certificate, energy tax (Sweden only) and VAT)
              public var tax: Double? {
                get {
                  return resultMap["tax"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "tax")
                }
              }

              /// The start time of the price
              public var startsAt: String? {
                get {
                  return resultMap["startsAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "startsAt")
                }
              }
            }

            public struct Today: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Price"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("total", type: .scalar(Double.self)),
                  GraphQLField("energy", type: .scalar(Double.self)),
                  GraphQLField("tax", type: .scalar(Double.self)),
                  GraphQLField("startsAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(total: Double? = nil, energy: Double? = nil, tax: Double? = nil, startsAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Price", "total": total, "energy": energy, "tax": tax, "startsAt": startsAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The total price (energy + taxes)
              public var total: Double? {
                get {
                  return resultMap["total"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "total")
                }
              }

              /// Nordpool spot price
              public var energy: Double? {
                get {
                  return resultMap["energy"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "energy")
                }
              }

              /// The tax part of the price (guarantee of origin certificate, energy tax (Sweden only) and VAT)
              public var tax: Double? {
                get {
                  return resultMap["tax"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "tax")
                }
              }

              /// The start time of the price
              public var startsAt: String? {
                get {
                  return resultMap["startsAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "startsAt")
                }
              }
            }

            public struct Tomorrow: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Price"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("total", type: .scalar(Double.self)),
                  GraphQLField("energy", type: .scalar(Double.self)),
                  GraphQLField("tax", type: .scalar(Double.self)),
                  GraphQLField("startsAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(total: Double? = nil, energy: Double? = nil, tax: Double? = nil, startsAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Price", "total": total, "energy": energy, "tax": tax, "startsAt": startsAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The total price (energy + taxes)
              public var total: Double? {
                get {
                  return resultMap["total"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "total")
                }
              }

              /// Nordpool spot price
              public var energy: Double? {
                get {
                  return resultMap["energy"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "energy")
                }
              }

              /// The tax part of the price (guarantee of origin certificate, energy tax (Sweden only) and VAT)
              public var tax: Double? {
                get {
                  return resultMap["tax"] as? Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "tax")
                }
              }

              /// The start time of the price
              public var startsAt: String? {
                get {
                  return resultMap["startsAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "startsAt")
                }
              }
            }
          }
        }
      }
    }
  }
}
