require_relative './player'

class Game

  # constructor
  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players=[@player1, @player2].shuffle

  end


  def next_round
    
    puts "------------------------"
    puts " \tNew Turn"
    puts "------------------------"
  
    @players.rotate!

  end

  def display_status

    @players.each{|player|print "#{player.name} #{player.lives}/3 "}
    print "\n"

    # sleep 1
  end

  def winner
    # player who is not dead
    winner = @players.find{|player| !player.dead? }
    next_round
    puts "...some time later..."
    puts "The winner is #{winner.name}"
  end

  def game_over?
    @players.select{|player| player.dead?}.count > 0
  end

  def play

    attack_jedi = @players.first
    defend_jedi = @players.last
    attack_jedi.ask(defend_jedi)
    print "> "
    ans  = gets.chomp.to_i
    attack_jedi.answer(ans,defend_jedi)
    display_status
    
    until (game_over?) do
      attack_jedi = @players.first
      defend_jedi = @players.last
      next_round
      attack_jedi.ask(defend_jedi)
      print "> "
      ans  = gets.chomp.to_i
      attack_jedi.answer(ans,defend_jedi)
      display_status
    end

    winner
  end

end