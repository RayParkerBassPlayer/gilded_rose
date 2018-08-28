require "normal_item"

class Sulfuras < NormalItem
  def initialize(days_remaining:, quality:)
    super(days_remaining: days_remaining, quality: quality)
    @name = 'Sulfuras, Hand of Ragnaros'
  end

  protected

  def tick_days_remaining
    # days remain the same.
  end

  def tick_quality
    # quality remains the same.
  end
end
