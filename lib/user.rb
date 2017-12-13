require_relative "joke"
class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name  = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user,  joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    jokes.each { |joke| user.jokes << joke }
  end

  def learn_routine(filepath)
    contents = CSV.open filepath, headers: true, header_converters: :symbol
    contents.each { |row| @jokes << Joke.new(row) }
  end
end
