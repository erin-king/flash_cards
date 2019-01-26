require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    # pry(main)> deck = Deck.new([card_1, card_2, card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists

    assert_instance_of Round, @round
  end

  def test_it_has_attributes

    assert_equal @deck, @round.deck
  end

  def test_it_starts_with_no_turns

    assert_equal [], @round.turns
  end

  def test_the_current_card_is_first_in_the_card_array

    assert_equal @card_1, @round.current_card
  end

  def test_it_can_create_turn_obeject_when_take_turn
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
    assert_equal "Juneau", new_turn.guess
    assert new_turn.correct?
    assert_equal @card_1, new_turn.card
  end

  def test_it_advances_to_next_card_after_take_turn
    # skip
    new_turn = @round.take_turn("Juneau")
    newer_turn = @round.take_turn("Mars")

    assert_equal @card_3, @round.current_card
  end

  def test_it_stores_turn_at_take_turn
    # skip
    new_turn = @round.take_turn("Juneau")
    newer_turn = @round.take_turn("Mars")

    assert_equal [new_turn, newer_turn], @round.turns
  end




end


# pry(main)> round.turns
# #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
#
# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> round.take_turn("Venus")
# #=> #<Turn:0x00007f972a215b38...>
#
# pry(main)> round.turns.count
# #=> 2
#
# pry(main)> round.turns.last.feedback
# #=> "Incorrect."
#
# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.number_correct_by_category(:Geography)
# #=> 1
#
# pry(main)> round.number_correct_by_category(:STEM)
# #=> 0
#
# pry(main)> round.percent_correct
# #=> 50.0
#
# pry(main)> round.percent_correct_by_category(:Geography)
# #=> 100.0
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>