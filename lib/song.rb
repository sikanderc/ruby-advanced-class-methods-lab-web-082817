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
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { | songs | songs.name }
  end

  def self.new_from_filename(mp_three)
    song_and_artist = mp_three[0..-5]
    filename_arr = song_and_artist.split(" - ")
    new_song = self.new
    new_song.artist_name = filename_arr[0]
    new_song.name = filename_arr[1]
    new_song
  end

  def self.create_from_filename(mp_three)
    song_and_artist = mp_three[0..-5]
    filename_arr = song_and_artist.split(" - ")
    new_song = self.new
    new_song.artist_name = filename_arr[0]
    new_song.name = filename_arr[1]
    @@all << new_song
    new_song
    @@all.detect { |song| song.name == new_song.name }
  end

  def self.destroy_all
    @@all = []
  end

end
