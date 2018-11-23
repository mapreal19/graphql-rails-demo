module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    field :allMovies, [Types::MovieType], null: true, description: "List of movies"

    field :movie, Types::MovieType, null: false, description: "Returns a movie" do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    def all_movies
      Movie.all
    end

    def movie(id:)
      Movie.find(id)
    end
  end
end
