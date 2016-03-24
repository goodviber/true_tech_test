class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets

  validates :add1, presence: true, length: { maximum: 100 }
	validates :street, presence: true, length: { maximum: 100 }
	validates :town, presence: true, length: { maximum: 70 }
	validates :country, presence: true, length: { maximum: 50 }
	validates :postcode, presence: true, length: { maximum: 50 }


  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{add1}, #{street}, #{town}, #{country}, #{postcode}"
  end

  attachment :user_image, content_type: ["image/jpeg", "image/png", "image/gif"]
	validates :user_image_size, numericality: { allow_nil: true, less_than: 150000, :message => "must be less than 150kB" }
end
