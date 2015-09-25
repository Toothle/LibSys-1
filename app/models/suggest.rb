class Suggest < ActiveRecord::Base
  validates :ISBN, uniqueness: true
end
