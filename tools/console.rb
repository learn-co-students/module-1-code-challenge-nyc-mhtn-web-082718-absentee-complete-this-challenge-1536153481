require 'pry'
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


c1 = Customer.new("Bob","Newman")
c2 = Customer.new("Ellie", "Swanson")
c3 = Customer.new("Amber", "Dawes")
r1 = Restaurant.new("Jack in the Box")
r2 = Restaurant.new("KFC")
rev1 = Review.new(c1, r1, "Jack in the Box sucks", 1)
rev2 = Review.new(c1, r2, "KFC is my go-to!", 4)
rev3 = Review.new(c2, r1, "Jack in the box is really not too bad", 3)
rev4 = Review.new(c3, r1, "Meh.", 2)
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
