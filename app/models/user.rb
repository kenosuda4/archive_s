class User < ApplicationRecord
  
  has_many :menus, dependent: :destroy
  has_many :competitions, dependent: :destroy

  has_many :bookmarks
  has_many :bookmarks_menus, through: :bookmarks, source: :menu

  has_many :records, dependent: :destroy
  has_many :raps, dependent: :destroy

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

  # テストログイン用
  def self.guest
    find_or_create_by!(name: 'guest',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.sort(selection)
    case selection
    when 'new'
        return order(created_at: :DESC)
    when 'old'
        return order(created_at: :ASC)
    when 'many'
        return find(Menu.group(:user_id).order(Arel.sql('count(user_id) desc')).pluck(:user_id))
    when 'few'
      return find(Menu.group(:user_id).order(Arel.sql('count(user_id) asc')).pluck(:user_id))
    end
  end
end



