require_relative "../juke.rb"

RSpec.describe Playlist do
  describe ".new" do
    it "Plays songs that are on the list" do
      playlist = Playlist.new(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block"])
      expect(playlist.songs).to eq(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block"])
    end

    it "removes songs that are not on the list" do
      playlist = Playlist.new(["Down Under - Men at Work", "Beastie Boys - Sabotage", "Hangin' Tough - New Kids on the Block"])
      expect(playlist.songs).to eq(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block"])
    end
  end

  describe "#shuffle!" do
    it "should shuffle the order of the playlist" do
      playlist = Playlist.new(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block", "We Built This City - Starship"])
      first_song = []
        50.times do
          playlist.shuffle!
          first_song << playlist.songs[0]
        end
        expect(first_song.uniq.sort).to eq(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block", "We Built This City - Starship"])
    end
  end

  describe "#play!" do
    it "should remove the first song from the list perminently" do
      playlist = Playlist.new(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block", "We Built This City - Starship"])
      playlist.play!
      expect(playlist.songs).to eq(["Hangin' Tough - New Kids on the Block", "We Built This City - Starship"])
    end
  end

  describe "#add_track" do
    it "should add a track if the song is available" do
      playlist = Playlist.new(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block"])
      playlist.add_track("We Built This City - Starship")
      expect(playlist.songs).to eq(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block", "We Built This City - Starship"])
    end

    it "should return true if the song is available" do
      playlist = Playlist.new(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block"])
      expect(playlist.add_track("We Built This City - Starship")).to eq(true)
    end

    it "should return false if the song is unavailable to add" do
      playlist = Playlist.new(["Down Under - Men at Work", "Hangin' Tough - New Kids on the Block"])
      expect(playlist.add_track("Sabotage - Beastie Boys")).to eq(false)
    end
  end
end
