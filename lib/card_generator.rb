require 'pry'
require 'csv'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def open_file(filename)
    cards = CSV.open(filename)
  end

  def cards
    
  end

#   contents = CSV.open "event_attendees.csv", headers: true
# contents.each do |row|
#   name = row[2]
#   puts name
# end

end
