require 'pry'
class Playlist
  attr_accessor :songs, :options
  def initialize(songs)
    @songs = []

    @options = ["Hello - Lionel Ritchie",
    "Kokomo – The Beach Boys",
    "Girl You Know It’s True – Milli Vanilli ",
    "Agadoo – Black Lace",
    "Down Under - Men at Work",
    "Nothing's Gonna Stop Us Now - Starship",
    "Get Outta My Dreams, Get Into My Car - Billy Ocean",
    "I Just Called To Say I Love You - Stevie Wonder",
    "Hangin' Tough - New Kids on the Block",
    "We Built This City - Starship",
    "Wake Me Up Before You Go Go - Wham!",
    "We Didn't Start The Fire - Billy Joel",
    "I Wanna Dance With Somebody - Whitney Houston",
    "U Can't Touch This - MC Hammer"]

    songs.each do |song|
      if @options.include?(song)
        @songs << song
      end
    end
  end

  def shuffle!
    songs.shuffle!
  end

  def play!
    @songs = @songs[1..-1]
  end

  def add_track(track)
    if @options.include? track
      @songs << track
      true
    else
      false
    end
  end
end
