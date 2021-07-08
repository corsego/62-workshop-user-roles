class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # include Roleable

  has_many :posts, through: :roles, source: :resource, source_type: :Post
  has_many :created_posts, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Post
  has_many :edited_posts, -> { where(roles: {name: :editor}) }, through: :roles, source: :resource, source_type: :Post

end
