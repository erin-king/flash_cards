require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# card_1 = Card.new("1 + 1", "2", :Math)
# card_2 = Card.new("2 + 2", "4", :Math)
# card_3 = Card.new("0 + 1", "1", :Math)
# card_4 = Card.new("What is I lowercase?", "i", :Letters)
# card_5 = Card.new("What is N lowercase?", "n", :Letters)
#
# cards = [card_1, card_2, card_3, card_4, card_5]

filename = "cards.txt"

cards = CardGenerator.new(filename).cards

deck_1 = Deck.new(cards)

round_1 = Round.new(deck_1)

round_1.start
