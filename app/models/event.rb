class Event < ActiveRecord::Base
    belongs_to :user
    has_many :event_categories
    has_many :categories, through: :event_categories
    validates :title, presence: true, length: { minimum:3, maximum: 100 }
    validates :description, presence: true, length: { minimum:10, maximum: 500 }
    validates :user_id, presence: true

end