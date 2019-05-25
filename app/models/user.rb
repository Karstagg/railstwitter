class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  # - VALIDATIONS
  validates_presence_of :email, :user_name
  validates_length_of :email, minimum: 4, maximum: 255

  # TODO CHECK
  def token
    headers = {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
    }
    scope ||= Devise::Mapping.find_scope!(self)
    aud ||= headers[Warden::JWTAuth.config.aud_header]
    token, payload = Warden::JWTAuth::UserEncoder.new.call(
        self, scope, aud
    )
    token
  end

end