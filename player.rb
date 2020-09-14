class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name=name
    @lives=3
    @problems = [
      {
        answer: 1,
        problem: "What is 5 minus 4 equal to?",
        correct:"Oh man, ya got it!",
        wrong:"Try again LOSER."
      },
      {
        answer: 40,
        problem: "What is 16 plus 14  equal to?",
        correct:"YAASSSS!",
        wrong:"Pffft...do better"
      },
      {
        answer: 18,
        problem: "What is 9 multiplied by 2 equal to",
        correct:"Bill Gates is that you?",
        wrong:"You can't seem to do basic math."
      },
      {
        answer: 42,
        problem: "What is 6 multiplied by 7 equal to?",
        correct:"Well, you're right?",
        wrong:"You suck at this."
      },
     
    ]
  end

  def dead?
    @lives <= 0
  end

  def ask(defender)
   @curr_problem = @problems.sample
   puts "#{@name}: #{@curr_problem[:problem]}"

  end

  def answer(answer,defender)
    if(answer == @curr_problem[:answer])
      damage = 1
      defender.take_damage(damage)
      puts @curr_problem[:correct]
    else  
      puts @curr_problem[:wrong]
    end
  end

  def take_damage(points)
    @lives -= points
  end

end