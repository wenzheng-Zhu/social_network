class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  belongs_to :user
end
