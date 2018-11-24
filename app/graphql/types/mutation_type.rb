require_relative "./sign_in_payload_type"

module Types
  class MutationType < Types::BaseObject
    field :signUp, Types::UserType, null: false do
      argument :authProvider, Types::AuthProviderEmailInput, required: true
    end

    field :signIn, Types::SignInPayload, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def sign_up(auth_provider:)
      User.create!(
        email: auth_provider[:email],
        password: auth_provider[:password]
      )
    end

    def sign_in(email:, password:)
      user = User.find_by(email: email)

      return unless user
      return unless user.authenticate(password)

      secret = Rails.application.credentials.secret_key_base.byteslice(0..31)
      crypt = ActiveSupport::MessageEncryptor.new(secret)
      token = crypt.encrypt_and_sign("user-id:#{user.id}")

      OpenStruct.new(user: user, token: token)
    end
  end
end
