require "spec_helper"
require_relative("../lib/aged_brie")

describe AgedBrie do
  subject(:aged_brie) do
    AgedBrie.new(days_remaining: days_remaining, quality: quality)
  end

  context 'Aged Brie' do
    context 'before sell date' do
      let(:days_remaining) { 5 }

      context 'with moderate quailty' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(5).to(4)
        end

        it 'should improve in quality by 1' do
          expect { aged_brie.tick }.to change { aged_brie.quality }
                                             .from(10).to(11)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(5).to(4)
        end

        it 'should remain at max quality' do
          expect { aged_brie.tick }.to_not change { aged_brie.quality }
        end
      end
    end

    context 'on sell date' do
      let(:days_remaining) { 0 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(0).to(-1)
        end

        it 'should improve in quality by 2' do
          expect { aged_brie.tick }.to change { aged_brie.quality }
                                             .from(10).to(12)
        end
      end

      context 'with near max quality' do
        let(:quality) { 49 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(0).to(-1)
        end

        it 'should improve quality to max' do
          expect { aged_brie.tick }.to change { aged_brie.quality }
                                             .from(49).to(50)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(0).to(-1)
        end

        it 'should remain at max quality' do
          expect { aged_brie.tick }.to_not change { aged_brie.quality }
        end
      end
    end

    context 'after sell date' do
      let(:days_remaining) { -10 }

      context 'with moderate quality' do
        let(:quality) { 10 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(-10).to(-11)
        end

        it 'should improve in quality by 2' do
          expect { aged_brie.tick }.to change { aged_brie.quality }
                                             .from(10).to(12)
        end
      end

      context 'with max quality' do
        let(:quality) { 50 }

        it 'should have one less day remaining' do
          expect { aged_brie.tick }.to change { aged_brie.days_remaining }
                                             .from(-10).to(-11)
        end

        it 'should remain at max quality' do
          expect { aged_brie.tick }.to_not change { aged_brie.quality }
        end
      end
    end
  end
end
