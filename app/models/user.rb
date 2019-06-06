class User < ApplicationRecord

  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true, message: { "Password must be 8 characters long" } }

  attr_reader :password

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      user
      redirect_to home_url #TODO, need url prefix name here
    else
      #User does not exists, throw error, also creates new User instance
      user = User.new(params)
      flash.now[:errors] = ["Invalid credentials!"]
    end
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
