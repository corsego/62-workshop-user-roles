class Post < ApplicationRecord
  validates :title, :user, presence: true
  belongs_to :user

  resourcify
  
  def to_s
    title
  end
end
