class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates :email, presence: true,
                    uniqueness: true

  validates :password, presence: true

  def password_match(params)
    params[:password] == params[:confirm_password]
  end
end
