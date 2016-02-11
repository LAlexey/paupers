class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  acts_as_voter

  has_many :tickets, foreign_key: :owner_id
  has_one :profile_image, as: :owner
  accepts_nested_attributes_for :profile_image, allow_destroy: true

  def as_json(options = {})
    {
      email: email,
      profile_image: profile_image.image.thumb.url
    }
  end
end
