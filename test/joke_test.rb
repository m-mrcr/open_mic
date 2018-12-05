require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/joke'

class JokeTest < Minitest::Test
  def test_joke_exists
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_instance_of Joke, joke
  end

  def test_that_id_method_works
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_equal 1, joke.id
  end


  def test_that_setup_method_returns_setup
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke.setup
  end


  def test_that_punchline_method_returns_punchline
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke.punchline
  end

end
