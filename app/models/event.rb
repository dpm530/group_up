class Event < ActiveRecord::Base
   belongs_to :location, required: true
   belongs_to :user, required: true

   has_many :groupups, dependent: :destroy
   has_many :users, through: :groupups, source: :user

   validates :name, presence: true, length: 2..40
   validates :date, presence: true
   validates :time, presence: true
   validates :description, length: { maximum: 500 }
   validates_date :date, on_or_after: :today

end
