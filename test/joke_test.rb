require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_it_exists
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_instance_of Joke, joke
  end

  def test_it_has_attributes_which_can_be_different
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    joke_3 = Joke.new({id: 3, question: "What do you call a cow with a twitch?", answer: "Beef jerky"})

    assert_equal 1, joke_1.id
    assert_equal "Why did the strawberry cross the road?", joke_1.question
    assert_equal "Because his mother was in a jam.", joke_1.answer
    assert_equal 2, joke_2.id
    assert_equal "How do you keep a lion from charging?", joke_2.question
    assert_equal "Take away its credit cards.", joke_2.answer
    assert_equal 3, joke_3.id
    assert_equal "What do you call a cow with a twitch?", joke_3.question
    assert_equal "Beef jerky", joke_3.answer
  end
end
