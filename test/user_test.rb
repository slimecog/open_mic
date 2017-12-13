require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'
require 'csv'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_user_has_jokes_starting_as_an_empty_array
    ali = User.new("Ali")

    assert_instance_of Array, ali.jokes
    assert_equal [], ali.jokes
  end

  def test_user_can_learn_jokes_and_add_them_to_jokes_collection
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    ali.learn(joke)

    assert_equal 1, ali.jokes.count
    assert_instance_of Joke, ali.jokes.first
    assert_equal joke, ali.jokes.first
  end

  def test_users_can_tell_each_other_jokes_and_the_listening_user_add_jokes_to_their_collection
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    sal.tell(ali, joke)

    assert_equal 1, ali.jokes.count
    assert_instance_of Joke, ali.jokes.first
    assert_equal joke, ali.jokes.first

    sal.tell(ali, joke_2)

    assert_equal 2, ali.jokes.count
    assert_instance_of Joke, ali.jokes.first
    assert_instance_of Joke, ali.jokes.last
    assert_equal joke, ali.jokes.first
    assert_equal joke_2, ali.jokes.last
  end

  def test_users_can_perform_routines_for_other_users_and_listening_users_learn_the_jokes
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)

    assert_equal 2, josh.jokes.count
    assert_instance_of Joke, josh.jokes.first
    assert_instance_of Joke, josh.jokes.last
    assert_equal joke_1, josh.jokes.first
    assert_equal joke_2, josh.jokes.last
  end

  def test_users_can_learn_routine_from_csv_file_and_add_all_jokes_to_collection
    casey = User.new("Casey")

    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
    casey.jokes.each { |joke| assert_instance_of Joke, joke }
  end
end
