class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    new_joke = Joke.new(joke)
    @jokes << new_joke
  end

  def tell(audience, joke)        
    listener = User.new(audience)
    listener.jokes << joke
  end

  def perform_routine_for(name)
    listener = User.new(name)
    listener.jokes << @jokes[0..99]
  end

end
