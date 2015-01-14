require 'rails_helper'

RSpec.describe RequestForm do
  let(:date) { Date.current }
  let(:time) { Time.current }
  let(:comment) { Faker::Lorem.sentence(3) }
  let(:request_form) { RequestForm.new(date: date, time: time, comment: comment) }
  let(:subject) { request_form }

  describe '#initialize' do
    its(:valid?){ is_expected.to eq true }
  end

  describe '#persist!' do
    it 'should create Request' do
      expect{ request_form.persist! }.to change{ Request.count }.by(1)

      created_request = Request.last
      request_time = created_request.time

      expect(request_time.to_date).to eq date
      expect(request_time.hour).to    eq time.hour
      expect(request_time.min).to     eq time.min
    end
  end
end
