class NormalItem
  attr_reader :name, :days_remaining, :quality

  protected

  attr_writer :days_remaining, :quality

  public

  def initialize(days_remaining:, quality:)
    @name = 'Normal Item'
    self.days_remaining = days_remaining
    self.quality = quality
  end

  def tick
    tick_days_remaining
    tick_quality
  end

  protected

  def tick_days_remaining
    self.days_remaining = self.days_remaining - 1
  end
  
  def sell_date?
    self.days_remaining == 0
  end

  def past_sell_date?
    self.days_remaining < 0
  end

  def tick_quality
    return if self.quality <= 0
    
    if sell_date? || past_sell_date?
      self.quality = self.quality - 2
      return
    end

    self.quality = self.quality - 1
  end
end
