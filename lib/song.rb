require 'pry'
class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  # def initialize(name)
  #   @name = name
  # end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  # def self.song
  #   Song.create
  # end
  
  def Song.create
    @@all << Song.new
    @@all.last
  end
  
  def Song.new_by_name(name)
    Song.create.name = name
    @@all.last
  end
  
  def Song.create_by_name(name)
    Song.create.name = name
    return self.all.last
  end
  
  def self.find_by_name(name)
    @@all.find{|p| p.name == name}
  end
  
  def Song.find_or_create_by_name(name)
    if self.find_by_name(name)
      #puts "Aleady here!"
      
    else
       self.create_by_name(name)
 
    #   self.find_by_name(name)
    end
  end
  #binding.pry
end
