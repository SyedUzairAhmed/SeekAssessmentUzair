// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetJobQuery: GraphQLQuery {
  public static let operationName: String = "GetJob"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetJob($id: String!) { job(id: $id) { __typename _id positionTitle description salaryRange { __typename min max } location industry haveIApplied } }"#
    ))

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: BaseAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BaseAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("job", Job?.self, arguments: ["id": .variable("id")]),
    ] }

    public var job: Job? { __data["job"] }

    /// Job
    ///
    /// Parent Type: `Job`
    public struct Job: BaseAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BaseAPI.Objects.Job }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", String?.self),
        .field("positionTitle", String?.self),
        .field("description", String?.self),
        .field("salaryRange", SalaryRange?.self),
        .field("location", Int?.self),
        .field("industry", Int?.self),
        .field("haveIApplied", Bool?.self),
      ] }

      public var _id: String? { __data["_id"] }
      public var positionTitle: String? { __data["positionTitle"] }
      public var description: String? { __data["description"] }
      public var salaryRange: SalaryRange? { __data["salaryRange"] }
      public var location: Int? { __data["location"] }
      public var industry: Int? { __data["industry"] }
      public var haveIApplied: Bool? { __data["haveIApplied"] }

      /// Job.SalaryRange
      ///
      /// Parent Type: `SalaryRange`
      public struct SalaryRange: BaseAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BaseAPI.Objects.SalaryRange }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("min", Int?.self),
          .field("max", Int?.self),
        ] }

        public var min: Int? { __data["min"] }
        public var max: Int? { __data["max"] }
      }
    }
  }
}
