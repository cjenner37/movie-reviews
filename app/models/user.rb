class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

   has_many :viewings
   has_many :movies, through: :viewings
   has_many :creations, class_name: "Movie"
   has_many :reviews

   validates_presence_of :first_name
   validates_presence_of :last_name

   def full_name
   	first_name + " " + last_name
   end
end
