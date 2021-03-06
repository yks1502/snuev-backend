class AuthorizeApiRequest
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    if user.last_signed_out_at && user.last_signed_out_at.to_i > decoded_auth_token[:iat]
      raise(ExceptionHandler::InvalidToken, 'Token is invalidated')
    end
    { user: user }
  end

  private

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken,
      ("Invalid token #{e.message}")
    )
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
      raise(ExceptionHandler::MissingToken, 'Missing token')
  end
end
