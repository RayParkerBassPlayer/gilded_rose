require "spec_helper"
require_relative("../lib/mana_cake")

describe ManaCake do
  subject(:mana_cake) do
    ManaCake.new(days_remaining: days_remaining, quality: quality)
  end

  context 'Conjured Mana Cake' do
    context 'before sell date' do
      let(:days_remaining) { 5 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { mana_cake.tick }.to change { mana_cake.days_remaining }
                                             .from(5).to(4)
        end

        it 'should diminish in quality by 2' do
          expect { mana_cake.tick }.to change { mana_cake.quality }
                                             .from(10).to(8)
        end
      end

      context 'with no quality' do
        let(:quality) { 0 }

        it 'should have one less day remaining' do
          expect { mana_cake.tick }.to change { mana_cake.days_remaining }
                                             .from(5).to(4)
        end

        it 'should remain at no quality' do
          expect { mana_cake.tick }.to_not change { mana_cake.quality }
        end
      end
    end

    context 'on sell date' do
      let(:days_remaining) { 0 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { mana_cake.tick }.to change { mana_cake.days_remaining }
                                             .from(0).to(-1)
        end

        it 'should diminish in quality by 4' do
          expect { mana_cake.tick }.to change { mana_cake.quality }
                                             .from(10).to(6)
        end
      end

      context 'with no quality' do
        let(:quality) { 0 }

        it 'should have one less day remaining' do
          expect { mana_cake.tick }.to change { mana_cake.days_remaining }
                                             .from(0).to(-1)
        end

        it 'should remain at no quality' do
          expect { mana_cake.tick }.to_not change { mana_cake.quality }
        end
      end
    end

    context 'after sell date' do
      let(:days_remaining) { -10 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { mana_cake.tick }.to change { mana_cake.days_remaining }
                                             .from(-10).to(-11)
        end

        it 'should diminish in quality by 4' do
          expect { mana_cake.tick }.to change { mana_cake.quality }
                                             .from(10).to(6)
        end
      end

      context 'with no quality' do
        let(:quality) { 0 }

        it 'should have one less day remaining' do
          expect { mana_cake.tick }.to change { mana_cake.days_remaining }
                                             .from(-10).to(-11)
        end

        it 'should remain at no quality' do
          expect { mana_cake.tick }.to_not change { mana_cake.quality }
        end
      end
    end
  end
end
