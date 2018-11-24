class GraphqlRailsDemoSchema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)
end
