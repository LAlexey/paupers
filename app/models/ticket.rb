class Ticket < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner_id
  belongs_to :vendor
end
