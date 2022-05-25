class Hero < ApplicationRecord
    validates :name, presence: true, length: { minimum:2, maximum: 15 }
    validates :category, presence: true, length: {minimum:4, maximum: 15}
end
