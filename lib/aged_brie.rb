require "normal_item"

class AgedBrie < NormalItem
  def initialize(days_remaining:, quality:)
    super(days_remaining: days_remaining, quality: quality)
    @name = 'Aged Brie'
  end
  protected

  def tick_quality
    max_quality = 50

    if sell_date? || past_sell_date?
      self.quality = max(max_quality, self.quality + 2)
      return
    end
    
    self.quality = max(max_quality, self.quality + 1)
  end

  def max(max, an_integer)
    [an_integer,  max].min
  end
end
