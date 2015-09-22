class Book < ActiveRecord::Base
  validates(:ISBN, presence: true, uniqueness: true)
  validates(:title, presence: true)
  validates(:author, presence: true, length: { maximum: 30 })
  validates(:status, presence: true)
  validates(:description, length: { maximum: 255 })
end
