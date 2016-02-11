class Ticket < ActiveRecord::Base
  include AASM

  belongs_to :user, foreign_key: :owner_id
  belongs_to :service
  belongs_to :vendor

  before_validation :set_vendor, on: :create

  validates :user, :service, presence: true
  validates :vendor, presence: true

  scope :with_vendor, ->(vendor) { where(vendor: vendor) }

  aasm column: 'state' do
    state :confirming, initial: true
    state :approving    # after filling full ticket form, vendor can see this ticket
    state :performing   # if venodr get this ticket in work
    state :done         # when job is done
    state :cancelled    # smbd cancelled job

    event :confirm do
      transitions from: :confirming, to: :approving
    end

    event :approve do
      transitions from: :approving, to: :performing
    end

    event :finish do
      transitions from: :performing, to: :done
    end

    event :cancel do
      transitions from: [:approving, :performing], to: :cancelled
    end
  end

  protected
  def set_vendor
    self.vendor ||= service.vendor
  end
end
