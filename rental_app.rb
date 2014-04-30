require 'pry-byebug'

class Location
  attr_accessor :postcode, :apartments
  
  def initialize(args={})
    @postcode = args.fetch(:postcode)
    @apartments = {}
  end

end

class Apartment 
  attr_accessor :size, :number_of_rooms, :location, :baths, :tenants, :name

   def initialize(name, price, beds, baths)
    @name = name
    @beds = beds
    @location = {}
    @baths = baths
    @tenants = {}
    @price = price
  end

  def is_occupied?
    tenants.any?
  end

end

class Person
  attr_accessor :name, :apartment

  def initialize(args={})
    @name = args.fetch(:name, nil)
    @apartment = args.fetch(:apartment, nil)
  end

end

l = Location.new(postcode: 'W1 3QL')
a = Apartment.new('The Warnes', 4000, 3, 2)
a2 = Apartment.new('Wilbury Road', 2850, 2, 2)
p = Person.new

l.apartments[a.object_id] = a

def get_response
  puts `clear`
  puts "What would you like to do? Add (a)partments, (t)enants or (l)ocations?"
  gets.chomp.downcase
end

response = get_response

while response != 'q'
  case response
  when 'a'
    # Name, price, beds and baths
    print "Name: "; name = gets.chomp
    print "Price: "; price = gets.chomp
    print "Beds: "; beds = gets.chomp
    print "Baths: "; baths = gets.chomp
    l.apartments[name] = Apartment.new(name, price, beds, baths)
    break
  when 't'
  when 'l'
  else
    puts "Sorry, try again"
    get_response
  end
end

binding.pry

# locations contains apartments contains tenants contains something else
# Need an app that allows us to create apartments, add apartments to locations

# User interface!!

# l.apartments.select{|key, apartment| !apartment.is_occupied?}






