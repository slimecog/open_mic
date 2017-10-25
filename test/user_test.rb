require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'

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

  def test_it_can_learn_jokes
    sal = User.new("Sal")
    sal.learn(({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."}))

    assert_equal 1, sal.jokes.count
  end

  def test_sal_can_teach_ali_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."}))
    sal.tell("Ali", ({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."}))

    assert_equal 1, ali.jokes.count
  end

  def test_can_perform_routine
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."}))
    sal.learn(({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."}))
    sal.perform_routine_for("Ali")

    assert_equal 2, ali.jokes.count
  end
end
