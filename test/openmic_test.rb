require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/joke'
require './lib/user'
require './lib/openmic'

class OpenMicTest < Minitest::Test
  def test_open_mic_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_instance_of OpenMic, open_mic
  end

  def test_open_mic_sees_location
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal "Comedy Works", open_mic.location
  end

  def test_open_mic_sees_date
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal "11-20-18", open_mic.date
  end

  def test_open_mic_can_have_performers
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    open_mic.performers
  end

  def test_open_mic_can_welcome_performers
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    open_mic.performers
  end

  def test_there_are_no_repeated_jokes
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_1)
    ali.learn(joke_2)
    assert_equal false, open_mic.repeated_jokes?
  end

  def test_there_are_repeated_jokes
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_1)
    ali.learn(joke_2)
    ali.tell(sal, joke_1)
    assert_equal true, open_mic.repeated_jokes?
  end


end
