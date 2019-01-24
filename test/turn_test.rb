require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
    assert_equal card, turn.card
  end

  def test_it_can_detect_correct_and_incorrect_answers
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card)
    turn_2 = Turn.new("Utqiagvik", card)

    assert turn_1.correct?
    refute turn_2.correct?
  end

  def test_it_can_give_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card)
    turn_2 = Turn.new("Utqiagvik", card)

    assert_equal "Correct!", turn_1.feedback
    assert_equal "Incorrect.", turn_2.feedback
  end

end
