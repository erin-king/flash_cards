require './lib/turn'

class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  def current_card
    @deck.cards[@current_card_index]
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
    ((number_correct.to_f / @turns.count.to_f) * 100).round(1)
  end

  def number_of_turns_by_category(category)
    total_by_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    total_by_category.length
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / number_of_turns_by_category(category).to_f) * 100).round(1)
  end

  def play_game
    @deck.cards.each do |card|
      puts "This is card number #{@current_card_index + 1} out of #{@deck.count}."
      puts "Question: #{current_card.question}"
      guess = gets.chomp
      turn = take_turn(guess)
      puts turn.feedback
      puts "-------------------------------------------------"
    end
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@turns.count} for a total score of #{percent_correct}%."
    @deck.card_categories.each do |category|
      puts "#{category}: #{percent_correct_by_category(category)}% correct."
    end
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"
    play_game
    game_over
  end

end
