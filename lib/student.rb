class Student
  attr_reader :name,
              :age,
              :scores

  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @scores = {}
  end

  def log_score(course, score)
    if @scores.key?(course)
      @scores[course] << score
    else
      @scores[course] = [score]
    end

  end

  def grade(course)
    @scores[course].reduce { |tot, score| tot + score }.to_f / @scores[course].size
  end

  def ovr_grade
    just_scores = @scores.keys.reduce(0) do |tot, course|
      tot + self.grade(course)
    end

    just_scores.to_f / @scores.size
  end
end
