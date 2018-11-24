module Types
  class MutationType < Types::BaseObject
    field :signUpUser, Types::UserType, null: false do
      argument :authProvider, Types::AuthProviderEmailInput, required: true
    end

    def sign_up_user(auth_provider:)
      User.create!(
        email: auth_provider[:email],
        password: auth_provider[:password]
      )
    end
  end
end
