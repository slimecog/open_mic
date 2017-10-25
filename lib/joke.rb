class Joke
  attr_reader :id,
              :question,
              :answer

  def initialize(attributes)
    @id       = attributes[:id]
    @question = attributes[:question]
    @answer   = attributes[:answer]
  end
end
