require 'rails_helper'

RSpec.describe Planet, type: :model do
  let(:user) { User.new(name: 'lewagon', email: 'lewagon@gmail.com', password: 'lewagon') }
  let(:planet) { Planet.new(name: 'Planet', description: 'Description', price_per_night: 40, maximum_guests: 10, user: user) }
  let(:reservation) { Reservation.new(start_date: Date.today, end_date: Date.today, number_of_guests: 5, reservation_status: 'approved', planet: planet, user: user) }

  describe '#initialize' do
    context 'when valid' do
      it 'generates a valid reservation with all columns' do
        expect(reservation.valid?).to eq(true)
      end
    end

    context 'when invalid' do
      context 'without start date' do
        before do
          reservation.start_date = nil
        end

        it 'generates an invalid reservation' do
          expect(reservation.valid?).to eq(false)
        end

        it 'generates an error message' do
          reservation.valid?
          expect(reservation.errors.messages).to eq({ start_date: ["can't be blank"] })
        end
      end
    end

    context 'when invalid' do
      context 'without end date' do
        before do
          reservation.end_date = nil
        end

        it 'generates an invalid reservation' do
          expect(reservation.valid?).to eq(false)
        end

        it 'generates an error message' do
          reservation.valid?
          expect(reservation.errors.messages).to eq({ end_date: ["can't be blank"] })
        end
      end
    end

    context 'when invalid' do
      context 'without number of guests' do
        before do
          reservation.number_of_guests = nil
        end

        it 'generates an invalid reservation' do
          expect(reservation.valid?).to eq(false)
        end

        it 'generates an error message' do
          reservation.valid?
          expect(reservation.errors.messages).to eq({ number_of_guests: ["can't be blank"] })
        end
      end
    end
  end
end
