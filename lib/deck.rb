require 'pry'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end

  def card_categories
    categories = []
    @cards.each do |card|
      categories << card.category
    end
    categories.uniq
  end

end
