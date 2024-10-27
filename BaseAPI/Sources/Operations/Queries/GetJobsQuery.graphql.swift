// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetJobsQuery: GraphQLQuery {
  public static let operationName: String = "GetJobs"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetJobs($limit: Int, $page: Int) { jobs(limit: $limit, page: $page) { __typename page size hasNext total jobs { __typename _id positionTitle description salaryRange { __typename min max } location industry haveIApplied } } }"#
    ))

  public var limit: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>

  public init(
    limit: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>
  ) {
    self.limit = limit
    self.page = page
  }

  public var __variables: Variables? { [
    "limit": limit,
    "page": page
  ] }

  public struct Data: BaseAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BaseAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("jobs", Jobs?.self, arguments: [
        "limit": .variable("limit"),
        "page": .variable("page")
      ]),
    ] }

    public var jobs: Jobs? { __data["jobs"] }

    /// Jobs
    ///
    /// Parent Type: `GetJobsResponse`
    public struct Jobs: BaseAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BaseAPI.Objects.GetJobsResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("page", Int?.self),
        .field("size", Int?.self),
        .field("hasNext", Bool?.self),
        .field("total", Int?.self),
        .field("jobs", [Job?]?.self),
      ] }

      public var page: Int? { __data["page"] }
      public var size: Int? { __data["size"] }
      public var hasNext: Bool? { __data["hasNext"] }
      public var total: Int? { __data["total"] }
      public var jobs: [Job?]? { __data["jobs"] }

      /// Jobs.Job
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

        /// Jobs.Job.SalaryRange
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
}
