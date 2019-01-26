require './lib/turn'

class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
    # @number_correct = 0
  end

  def current_card
    deck.cards[@current_card_index]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @current_card_index += 1
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct? == true
    end
  end


end
