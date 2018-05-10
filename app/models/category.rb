class Category < ApplicationRecord
  has_many :restaurants, dependent: :destory
end
