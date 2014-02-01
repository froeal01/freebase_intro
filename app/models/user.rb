class User < ActiveRecord::Base
		has_secure_password
		before_create {generate_token(:auth_token)}

		attr_accessible :email, :password, :password_confirmation, :auth_token, :score
		validates_presence_of :email
		validates_uniqueness_of :email
		validates :email, format: {with: /.+@.{2,}\.[a-zA-Z]{2,6}/, message: "- must be a valid format"}
		validates_presence_of :password, :on => :create, :confirmation => true
		validates_confirmation_of :password

def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

end