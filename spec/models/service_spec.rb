require 'rails_helper'

RSpec.describe Service do
  let!(:service) { create(:service) }

  before { ServicesIndex.reset! }

  it 'test search' do


    services = ServicesIndex.query(query_string: { fields: [:title], query: ES.escape(service.title) }).load.to_a

    expect(services).to include service
  end
end

