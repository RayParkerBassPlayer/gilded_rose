require "spec_helper"
require_relative("../lib/normal_item")

describe NormalItem do
  subject(:normal_item) do
    NormalItem.new(days_remaining: days_remaining, quality: quality)
  end

  context 'Normal Item' do
    context 'of high quality' do
      let(:quality) { 10 }

      context 'before sell date' do
        let(:days_remaining) { 5 }

        it 'should have one less day remaining' do
          expect { normal_item.tick }.to change { normal_item.days_remaining }
                                             .from(5).to(4)
        end

        it 'should diminish in quality by 1' do
          expect { normal_item.tick }.to change { normal_item.quality }
                                             .from(10).to(9)
        end
      end

      context 'on sell date' do
        let(:days_remaining) { 0 }

        it 'should have one less day remaining' do
          expect { normal_item.tick }.to change { normal_item.days_remaining }
                                             .from(0).to(-1)
        end

        it 'should diminish in quality by 2' do
          expect { normal_item.tick }.to change { normal_item.quality }
                                             .from(10).to(8)
        end
      end

      context 'after sell date' do
        let(:days_remaining) { -10 }

        it 'should have one less day remaining' do
          expect { normal_item.tick }.to change { normal_item.days_remaining }
                                             .from(-10).to(-11)
        end

        it 'should diminish in quality by 2' do
          expect { normal_item.tick }.to change { normal_item.quality }
                                             .from(10).to(8)
        end
      end
    end

    context 'of no quality' do
      let(:days_remaining) { 5 }
      let(:quality) { 0 }

      it 'should have one less day remaining' do
        expect { normal_item.tick }.to change { normal_item.days_remaining }
                                           .from(5).to(4)
      end

      it 'should remain of no quality' do
        expect { normal_item.tick }.to_not change { normal_item.quality }
      end
    end
  end
end
