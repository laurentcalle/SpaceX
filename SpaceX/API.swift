// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MissionQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MissionQuery {
      launches {
        __typename
        mission_name
        launch_year
        launch_success
        details
        links {
          __typename
          article_link
        }
      }
    }
    """

  public let operationName: String = "MissionQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launches", type: .list(.object(Launch.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launches: [Launch?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launches": launches.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }])
    }

    public var launches: [Launch?]? {
      get {
        return (resultMap["launches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Launch?] in value.map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }, forKey: "launches")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("launch_year", type: .scalar(String.self)),
          GraphQLField("launch_success", type: .scalar(Bool.self)),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("links", type: .object(Link.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(missionName: String? = nil, launchYear: String? = nil, launchSuccess: Bool? = nil, details: String? = nil, links: Link? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "mission_name": missionName, "launch_year": launchYear, "launch_success": launchSuccess, "details": details, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var launchYear: String? {
        get {
          return resultMap["launch_year"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_year")
        }
      }

      public var launchSuccess: Bool? {
        get {
          return resultMap["launch_success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_success")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("article_link", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(articleLink: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "article_link": articleLink])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var articleLink: String? {
          get {
            return resultMap["article_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "article_link")
          }
        }
      }
    }
  }
}
