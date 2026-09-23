class User < ApplicationRecord
  has_many :posts
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { without: /\s/, message: "não pode conter espaços" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
