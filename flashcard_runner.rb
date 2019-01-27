require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

card_1 = Card.new("1 + 1", "2", :Math)
card_2 = Card.new("2 + 2", "4", :Math)
card_3 = Card.new("0 + 1", "1", :Math)
card_4 = Card.new("What is I lowercase?", "i", :Letters)
card_5 = Card.new("What is N lowercase?", "n", :Letters)

cards = [card_1, card_2, card_3, card_4, card_5]

deck_1 = Deck.new(cards)

round_1 = Round.new(deck_1)

round_1.start

# Seen together, the CLI will look something like this when the game is over:
#
# Welcome! You're playing with 4 cards.
# -------------------------------------------------
# This is card number 1 out of 4.
# Question: What is 5 + 5?
# 10
# Correct!
# This is card number 2 out of 4.
# Question: What is Rachel's favorite animal?
# panda
# Incorrect.
# This is card number 3 out of 4.
# Question: What is Mike's middle name?
# nobody knows
# Correct!
# This is card number 4 out of 4.
# Question: What cardboard cutout lives at Turing?
# Justin Bieber
# Correct!
# ****** Game over! ******
# You had 3 correct guesses out of 4 for a total score of 75%.
# STEM - 100% correct
# Turing Staff - 50% correct
# Pop Culture - 100% correct
