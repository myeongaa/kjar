class Company < ActiveRecord::Base
    belongs_to :csort
   has_many :ntickets
   has_many :reservations
end
