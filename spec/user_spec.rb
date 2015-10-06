require 'spec_helper'
require_relative '../user'

describe User do

  describe '.match' do
    context 'given some users' do
      before do
        @straight_guy = User.new(:male,:straight)
        @straight_girl = User.new(:female,:straight)
        @bi_guy = User.new(:male, :bi)
        @bi_girl = User.new(:female, :bi)
        @gay_guy = User.new(:male,:gay)
        @gay_girl = User.new(:female,:gay)
      end

      it 'returns true for straight guy and straight girl' do
        # binding.pry
        expect(User.match_them(@straight_guy, @straight_girl)).to eq(true)
      end

      it 'returns false if they are not a match' do
        expect(User.match_them(@straight_guy, @gay_guy)).to eq(false)
      end
    end
  end
end
