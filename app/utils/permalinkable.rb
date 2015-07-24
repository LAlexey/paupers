module Permalinkable
  extend ActiveSupport::Concern

  included do
    validates :permalink, presence: true

    before_validation :set_permalink, unless: :permalink?
  end

  private

  def set_permalink
    self.permalink = Russian::translit(permalink_source)
  end
end
