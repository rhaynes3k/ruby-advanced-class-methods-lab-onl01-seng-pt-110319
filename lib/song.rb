require 'pry'
class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
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
      puts "Aleady here!"
      self.find_by_name(name)
    else
       self.create_by_name(name)
    end
  end
  
  def Song.alphabetical
    self.all.sort_by{|s|s.name}
  end
  
  def Song.new_from_filename(file)
    @file = file
    arr = []
    art_n = []
    arr.push(file.split(" - ")).flatten
    self.create_by_name(arr[0][1].split(".mp3")).flatten#.artist_name = arr[0][0]
    
  end
  #binding.pry
end
