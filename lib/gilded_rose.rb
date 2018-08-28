require "normal_item"
require "backstage_pass"
require "aged_brie"
require "mana_cake"
require "sulfuras"

# Factory class to create NormalItems and children.
class GildedRose
  def self.new(name:, days_remaining:, quality:)
    case name
    when 'Aged Brie'
      AgedBrie.new(days_remaining: days_remaining, quality: quality)
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras.new(days_remaining: days_remaining, quality: quality)
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePass.new(days_remaining: days_remaining, quality: quality)
    when 'Conjured Mana Cake'
      ManaCake.new(days_remaining: days_remaining, quality: quality)
    when 'Normal Item'
      NormalItem.new(days_remaining: days_remaining, quality: quality)
    else
      raise "Unknow type requested. #{__FILE__}:#{__LINE__}"
    end
  end
end
