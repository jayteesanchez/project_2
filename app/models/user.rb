class User < ActiveRecord::Base
 has_many :shoes
 has_secure_password
 validates :email, presence: true, uniqueness: true
end
