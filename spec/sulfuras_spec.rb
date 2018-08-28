require "spec_helper"
require_relative("../lib/sulfuras")

describe Sulfuras do
  subject(:sulfuras) do
    Sulfuras.new(days_remaining: days_remaining, quality: quality)
  end

  context 'Sulfuras, Hand of Ragnaros' do
    let(:quality) { 80 }

    context 'before sell date' do
      let(:days_remaining) { 5 }

      it 'should remain at the same days remaining' do
        expect { sulfuras.tick }.to_not change { sulfuras.days_remaining }
      end

      it 'should remain at the same quality' do
        expect { sulfuras.tick }.to_not change { sulfuras.quality }
      end
    end

    context 'on sell date' do
      let(:days_remaining) { 0 }

      it 'should remain at the same days remaining' do
        expect { sulfuras.tick }.to_not change { sulfuras.days_remaining }
      end

      it 'should remain at the same quality' do
        expect { sulfuras.tick }.to_not change { sulfuras.quality }
      end
    end

    context 'after sell date' do
      let(:days_remaining) { -10 }

      it 'should remain at the same days remaining' do
        expect { sulfuras.tick }.to_not change { sulfuras.days_remaining }
      end

      it 'should remain at the same quality' do
        expect { sulfuras.tick }.to_not change { sulfuras.quality }
      end
    end
  end
end
