class User < ApplicationRecord
  
  has_many :menus, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  
  with_options presence: true do
    validates :name
    validates :email
    validates :encrypted_password
  end
  validates :is_deleted, inclusion: {in: [true, false]}
       
  mount_uploader :image, ImageUploader

end
