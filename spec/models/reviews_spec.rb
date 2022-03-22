require 'rails_helper'

RSpec.describe Planet, type: :model do
  let(:user) { User.new(name: 'lewagon', email: 'lewagon@gmail.com', password: 'lewagon') }
  let(:planet) { Planet.new(name: 'Planet', description: 'Description', price_per_night: 40, maximum_guests: 10, user: user) }
  let(:review) { Review.new(content: 'Content', rating: '5', planet: planet, user: user) }

  describe '#initialize' do
    context 'when valid' do
      it 'generates a valid review with all columns' do
        expect(review.valid?).to eq(true)
      end
    end

    context 'when invalid' do
      context 'without content' do
        before do
          review.content = nil
        end

        it 'generates an invalid planet' do
          expect(review.valid?).to eq(false)
        end

        it 'generates an error message' do
          review.valid?
          expect(review.errors.messages).to eq({ content: ["can't be blank"] })
        end
      end
    end

    context 'when invalid' do
      context 'without rating' do
        before do
          review.rating = nil
        end

        it 'generates an invalid planet' do
          expect(review.valid?).to eq(false)
        end

        it 'generates an error message' do
          review.valid?
          expect(review.errors.messages).to eq({ rating: ["can't be blank"] })
        end
      end
    end
  end
end
