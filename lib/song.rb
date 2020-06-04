require "pry"

class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  song = Song.new 
  #instantiates and 
  song.save
  #it returns the new song that was created
  song
end
def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
song = self.new_by_name(name)
song.save
song
end

def self.find_by_name(name)
  @@all.find {|song| song.name == name}

#binding.pry
end
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
 song = self.all.sort {|a , b | a.name <=> b.name }
  #binding.pry
end

def self.new_from_filename(file_name)
artist_name, song_name = file_name.split(" - ") 
song = self.new_by_name(song_name.gsub(".mp3" , "") )
song.artist_name = artist_name
song
#binding.pry
end

def self.create_from_filename(file_name)
song = self.new_from_filename(file_name)
song.save
song
end

def self.destroy_all
  @@all = []
end
end
