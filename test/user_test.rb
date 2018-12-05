require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def test_user_exists
    sal = User.new("Sal")
    assert_instance_of User, sal
  end

  def test_user_can_have_jokes
    sal = User.new("Sal")
    sal.jokes
  end

  def test_that_a_new_joke_can_be_made
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    assert_instance_of Joke, joke_1
  end

  def test_that_another_joke_can_be_made
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    assert_instance_of Joke, joke_2
  end

  def test_that_user_can_learn_a_joke
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1]
    sal = User.new("Sal")
    assert_equal [joke_1], sal.learn(joke_1)
  end

  def test_that_user_can_learn_another_joke
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    assert_equal [joke_2], sal.learn(joke_2)
  end

  def test_that_user_can_learn_multiple_jokes
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.jokes
  end

  def test_that_multiple_users_can_exist
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    ali = User.new("Ali")
    assert_instance_of User, ali
  end

  def test_that_user_can_tell_joke_to_other_user
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
  end

  def test_that_user_can_tell_another_joke_to_other_user
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_2)
  end

  def test_that_other_user_was_told_multiple_jokes
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)
    ali.jokes
  end

  def test_that_other_user_was_told_specific_joke
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)
    ali.joke_by_id(1)
  end

  def test_that_other_user_was_told_different_specific_joke
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    jokes = [joke_1, joke_2]
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)
    ali.joke_by_id(2)
  end

end
