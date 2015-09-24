class Book < ActiveRecord::Base
  has_many :histories, dependent: :destroy
  validates(:ISBN, presence: true, uniqueness: true)
  validates(:title, presence: true)
  validates(:author, presence: true, length: { maximum: 30 })
  validates(:description, length: { maximum: 255 })
  validates(:status, presence: true)
  validates(:status, inclusion: {in: ["available","checked out"], message: ": can only be \'available\' or \'checked out\'!"})
end
