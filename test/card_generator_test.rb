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

# pry(main)> filename = "cards.txt"
#=> "cards.txt"

# pry(main)> cards = CardGenerator.new(filename).cards
#=> [#<Card:0x007f9f1413cbe8 @answer="10", @question="What is 5 + 5?", @category="STEM">,
 #<Card:0x007f9f1413c788 @answer="red panda", @question="What is Rachel's favorite animal?", @category="Turing Staff">,
 #<Card:0x007f9f1413c2b0 @answer="nobody knows", @question="What is Mike's middle name?", @category="Turing Staff">,
 #<Card:0x007f9f14137da0 @answer="Justin bieber", @question="What cardboard cutout lives at Turing?", @category="Pop Culture">]
