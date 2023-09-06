class Student
  attr_reader :name,
              :age,
              :scores

  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    @scores.reduce { |tot, score| tot + score }.to_f / @scores.size
  end
end
