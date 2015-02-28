class Ticket < ActiveRecord::Base
  include AASM

  belongs_to :user, foreign_key: :owner_id
  belongs_to :service

  validates :user, :service, presence: true


end
