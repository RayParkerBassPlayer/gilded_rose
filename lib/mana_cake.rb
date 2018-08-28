require "normal_item"

class ManaCake < NormalItem
  def initialize(days_remaining:, quality:)
    super(days_remaining: days_remaining, quality: quality)
    @name = 'Conjured Mana Cake'
  end

  protected

  def tick_quality
    return if self.quality == 0
    
    if sell_date? || past_sell_date?
      self.quality = self.quality - 4
      return
    end

    self.quality = self.quality - 2
  end
end
