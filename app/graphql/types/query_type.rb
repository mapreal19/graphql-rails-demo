module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :allMovies,
          [Types::MovieType],
          null: true,
          description: "List of movies",
          resolve: ->(obj, args, ctx) { Movie.all }
  end
end
