class Board

attr_accessor :cells

  def initialize
    @cells =  [" ", " ", " ",
              " ", " ", " ",
              " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ",
              " ", " ", " ",
              " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    user_input = (user_input.to_i)
    @cells[user_input-1]
  end

  def full?
    @cells.none?{|a| a== " "}
  end

  def turn_count
    turn = 9 - @cells.count(" ")
  end

  def taken?(user_input)
    taken = self.position(user_input) == "X"  || self.position(user_input) == "O"
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def update(user_input, player)
    user_input = (user_input.to_i)
    @cells[user_input-1] = player.token
  end

end
