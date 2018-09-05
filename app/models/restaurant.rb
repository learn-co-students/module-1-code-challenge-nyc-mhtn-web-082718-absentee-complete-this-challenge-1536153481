class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  #eturns an array of all restaurants
  def self.all
    @@all
  end

  #given a string of restaurant name, returns the first restaurant that matches
  def self.find_by_name(name)
    self.all.find do |restuarant_obj|
      restuarant_obj.name == name
    end
  end

  #Returns a **unique** list of all customers who have reviewed a particular restaurant.
  def customers
    Review.all.select do |review_obj|
      review_obj.restaurant == self
    end.map do |review_obj|
      review_obj.customer
    end.uniq
  end

  #returns an array of all reviews for that restaurant
  def reviews
    Review.all.select do |review_obj|
      review_obj.restaurant == self
    end
  end

  #returns the average star rating for a restaurant based on its reviews
  def average_star_rating
    rating_array = reviews.map do |review_obj|
      review_obj.rating
    end
    rating_array.inject do |sum, x|
      sum + x
    end.to_f/rating_array.size
  end

  #returns the longest review content for a given restaurant
  def longest_review
    review_array = reviews.map do |review_obj|
      review_obj.content
    end
    review_array.max_by(&:length)
    #have an array of content strings
    #get the length of each string
    #return the string with the most length
  end
end
