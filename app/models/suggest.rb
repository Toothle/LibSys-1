class Suggest < ActiveRecord::Base
  validates(:ISBN, presence: true, uniqueness: true)
  validates(:title, presence: true)
  validates(:author, presence: true, length: { maximum: 30 })
  validates(:description, length: { maximum: 255 })
  validates(:status, presence: true)
end
