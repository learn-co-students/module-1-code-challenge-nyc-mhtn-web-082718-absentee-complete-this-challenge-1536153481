class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

#should return **all** of the customer instances
  def self.all
    @@all
  end

#given a string of a **full name**, returns the **first customer** whose full name matches
  def self.find_by_name(name)
    self.all.find do |customer_obj|
      name == customer_obj.full_name
    end
  end

#given a string of a first name, returns an **array** containing all customers with that first name
  def self.find_all_by_first_name(name)
    self.all.select do |customer_obj|
      customer_obj.first_name == name
    end
  end

  #should return an **array** of all of the customer full names
  def self.all_names
    self.all.map do |customer_obj|
      customer_obj.full_name
    end
  end

  #given a **restaurant object**, some review content (as a string), and a star rating (as an integer), creates a new review and associates it with that customer and restaurant.
  def add_review(restaurant, content, rating)
    Review.new(self, restaurant, content, rating)
  end

  #Returns the total number of reviews that a customer has authored
  def num_reviews
    review_array = Review.all.select do |review_obj|
      review_obj.customer == self
    end
    review_array.count
  end

  #Returns a **unique** array of all restaurants a customer has reviewed
  def restaurants
    Review.all.select do |review_obj|
      review_obj.customer == self
    end.map do |review_obj|
      review_obj.restaurant
    end.uniq
  end

end
