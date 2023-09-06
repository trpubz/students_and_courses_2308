require 'rspec'
require './lib/student'

RSpec.describe Student do
  it "exists" do
    morgan = Student.new({name: "Morgan", age: 21})
    expect(morgan).to be_instance_of(Student)
  end

  it "has attributes" do
    morgan = Student.new({name: "Morgan", age: 21})
    expect(morgan.name).to eq "Morgan"
    expect(morgan.age).to eq 21
  end

  it "starts with no scores" do
    morgan = Student.new({name: "Morgan", age: 21})
    expect(morgan.scores).to eq({})
  end

  it "can log scores" do
    morgan = Student.new({name: "Morgan", age: 21})
    morgan.log_score("Calc", 89)
    morgan.log_score("Calc", 78)
    expect(morgan.scores["Calc"]).to eq([89, 78])
  end

  it "can calculate grade" do
    morgan = Student.new({name: "Morgan", age: 21})
    morgan.log_score("Calc", 89)
    morgan.log_score("Calc", 78)
    expect(morgan.grade("Calc")).to eq (83.5)
  end

  describe '#ovr_grade' do
    it 'returns overall grade in courses' do
      morgan = Student.new({name: "Morgan", age: 21})
      morgan.log_score("Calc", 89)
      morgan.log_score("Calc", 78)
      # grade("Calc") => 83.5
      morgan.log_score("Maths", 84.5)
      expect(morgan.ovr_grade).to eq 84.0
    end
  end
end
