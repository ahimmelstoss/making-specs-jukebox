require 'simplecov'
SimpleCov.start
require 'json'
require 'rspec'

require_relative 'jukebox'
require_relative 'song'

songs = []
 songs << Song.new("The Phoenix - 1901")
 songs << Song.new("Tokyo Police Club - Wait Up")
 songs << Song.new("Sufjan Stevens - Too Much")
 songs << Song.new("The Naked and the Famous - Young Blood")
 songs << Song.new("(Far From) Home - Tiga")
 songs << Song.new("The Cults - Abducted")
 songs << Song.new("The Phoenix - Consolation Prizes")


RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

describe Song do

  it "can have a name" do
    pop = Song.new("1901")
    pop.name.should eq("1901")
  end
end

describe Jukebox do
	let(:jukebox) { Jukebox.new(songs) }

	it "is on by default" do
		jukebox.on?.should eq(true)
	end

	it "can be turned off" do
		jukebox.exit
		jukebox.on?.should eq(false)
	end

	it "can provide help" do
		jukebox.command("help").should eq("Please select help, list, exit, or play.")
	end

	it "can list all songs" do
		jukebox.command("list").should include("1 The Phoenix - 1901\n2 Tokyo Police Club - Wait Up\n3 Sufjan Stevens - Too Much\n4 The Naked and the Famous - Young Blood\n5 (Far From) Home - Tiga\n6 The Cults - Abducted\n7 The Phoenix - Consolation Prizes\n")
	end

	it "can play a song" do
		jukebox.command("play The Phoenix - 1901").should eq("now playing The Phoenix - 1901")
	end

	it "should not accept an invalid command" do 
		jukebox.command("blah").should eq("invalid command")
	end

end
