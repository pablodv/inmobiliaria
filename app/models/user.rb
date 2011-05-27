class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :first_name, :second_name, :username, :email, :password, 
  								:password_confirmation, :remember_me
end
