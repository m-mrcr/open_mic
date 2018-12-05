class User

  attr_reader :name,
              :jokes

  def initialize(name, jokes = [])
    @name = name
    @jokes = jokes
  end

  def learn(joke = [])
    jokes << joke
  end

  def joke_by_id(id)
    @jokes.find_all do |joke|
      id == joke.id
    end
  end

  def tell(name, joke = [])
    @jokes << joke
  end


end
