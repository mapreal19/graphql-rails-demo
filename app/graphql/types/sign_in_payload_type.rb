module Types
  class SignInPayload < Types::BaseObject
    field :token, String, null: true
    field :user, Types::UserType, null: true
  end
end
