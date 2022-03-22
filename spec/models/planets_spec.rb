require 'rails_helper'

RSpec.describe Planet, type: :model do
  let(:user) { User.new(name: 'lewagon', email: 'lewagon@gmail.com', password: 'lewagon') }
  let(:planet) { Planet.new(name: 'Planet', description: 'Description', price_per_night: 40, maximum_guests: 10, user: user) }

  describe '#initialize' do
    context 'when valid' do
      it 'generates a valid planet with all columns' do
        expect(planet.valid?).to eq(true)
      end
    end

    context 'when invalid' do
      context 'without name' do
        before do
          planet.name = nil
        end

        it 'generates an invalid planet' do
          expect(planet.valid?).to eq(false)
        end

        it 'generates an error message' do
          planet.valid?
          expect(planet.errors.messages).to eq({ name: ["can't be blank"] })
        end
      end
    end

    context 'when invalid' do
      context 'without description' do
        before do
          planet.description = nil
        end

        it 'generates an invalid planet' do
          expect(planet.valid?).to eq(false)
        end

        it 'generates an error message' do
          planet.valid?
          expect(planet.errors.messages).to eq({ description: ["can't be blank"] })
        end
      end
    end

    context 'when invalid' do
      context 'without price per night' do
        before do
          planet.price_per_night = nil
        end

        it 'generates an invalid planet' do
          expect(planet.valid?).to eq(false)
        end

        it 'generates an error message' do
          planet.valid?
          expect(planet.errors.messages).to eq({ price_per_night: ["can't be blank"] })
        end
      end
    end

    context 'when invalid' do
      context 'without maximum guests' do
        before do
          planet.maximum_guests = nil
        end

        it 'generates an invalid planet' do
          expect(planet.valid?).to eq(false)
        end

        it 'generates an error message' do
          planet.valid?
          expect(planet.errors.messages).to eq({ maximum_guests: ["can't be blank"] })
        end
      end
    end
  end
end
