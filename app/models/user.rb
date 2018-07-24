class User < ActiveRecord::Base
   belongs_to :location, required: true
   has_many :events, dependent: :destroy
   has_many :groupups, dependent: :destroy
   has_many :joined_events, through: :groupups, source: :event

   has_secure_password

   before_save :downcase_fields

   validates :name, presence: true, length: { minimum: 2 }
   # validates_format_of :name, with: /\A[-a-z]+\Z/i
   validates :email, presence: true, uniqueness: true
   validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
   validates :password, length: { minimum: 8 }



   def downcase_fields
      self.name.downcase!
      self.email.downcase!
   end
end
