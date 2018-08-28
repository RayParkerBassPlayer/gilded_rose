require "normal_item"

class BackstagePass < NormalItem
  def initialize(days_remaining:, quality:)
    @name = 'Backstage passes to a TAFKAL80ETC concert'
    self.days_remaining = days_remaining
    self.quality = quality
  end

  def tick
    # Reverse standard ticking routine to allow simpler math in assessing quality.
    tick_quality
    tick_days_remaining
  end

  protected

  def tick_quality
    if self.quality >= 50
      return
    end
    
    if sell_date? || past_sell_date?
      self.quality = 0
      return
    end

    if [1, 5].include?(self.days_remaining)
      self.quality = self.quality + 3
      return
    end

    if [6, 10].include?(self.days_remaining)
      self.quality = self.quality + 2
      return
    end

    if self.days_remaining == 11
      self.quality = self.quality + 1
      return
    end
  end
end
