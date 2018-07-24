class Location < ActiveRecord::Base
   validates :city, presence: true, length: { minimum: 2 }
   validates :state, presence: true, length: { is: 2 }
   

   def self.existsOrCreate(city, state)
      location=Location.find_by(city: city, state: state)

      if location
         return location
      end

      return Location.create(city: city, state: state)
   end


end
