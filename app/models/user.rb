class User < ApplicationRecord
	
	attr_accessor :password
	has_many :posts
	validates :name ,presence:true
	validates :email ,presence:true
	validates :password ,presence:true
	validates :password ,confirmation:true

	 def self.authentication(email, password)
	   user =find_by_email(email)
	  if user && user_passowrd_hash == Bcrypt::Engine.hash_secret( password, user.passowrd_salt)
		 user
	  else
		 nil
	  end

    end

    def encrypt_password
    	if password.present?
    		self.passowrd_salt = Bcrypt::Engine.generate_salt
    		self.passowrd_hash = Bcrypt::Engine.hash_secret(password , passowrd_salt)
    	end
    end

	def self.search(query)
		where("name like ? OR email like ? " , "%#{query}%","%#{query}%")
	end
end
                                                                                   