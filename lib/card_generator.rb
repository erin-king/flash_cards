require 'pry'
require 'csv'
require './lib/card'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def open_file(filename)
    CSV.open(filename)
  end

  def cards
    cards_array = []
    cards = open_file(@filename)
      cards.each do |row|
        question = row[0]
        answer = row[1]
        category = row[2]
        cards_array << Card.new(question, answer, category)
      end
      cards_array
  end


#   contents = CSV.open "event_attendees.csv", headers: true
# contents.each do |row|
#   name = row[2]
#   puts name
# end

end
