class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  # verify user credentials
  def user
    user = User.find_by_email(email)
    return user if user&.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
