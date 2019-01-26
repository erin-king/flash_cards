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

  def number_correct_by_category(category)
    total_by_category = 0
    @turns.find_all do |turn|
      if turn.card.category == category
        if turn.correct? == true
          total_by_category += 1
        end
      end
    end
    total_by_category
  end

  def percent_correct
    ((number_correct.to_f / @turns.count.to_f)* 100).round(1)
  end

end
