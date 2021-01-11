class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true

  def username
    return email.split('@').first.capitalize
  end
end
