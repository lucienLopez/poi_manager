class User < ActiveRecord::Base
  # Include default devise modules

  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
