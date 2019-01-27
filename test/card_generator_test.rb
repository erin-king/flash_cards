require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    cards = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, cards
  end

  def test_it_reads_cards
    card_generator = CardGenerator.new("cards.txt")
    cards = card_generator.cards

    assert_equal 4, cards.count
  end
end
