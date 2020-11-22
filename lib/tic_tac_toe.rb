


class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize
      @board = Array.new(9, " ")
    end
 


  



def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end





def input_to_index(i)
  i.to_i - 1
end 

def move(i,player = "X")
  @board[i] = player
end

def position_taken?(i)
  @board[i]== "X" || @board[i] == "O"
end


def valid_move?(i)
  i.between?(0,8) && !position_taken?(i)
end

def turn_count
  count = 0
  @board.each do |i|
    if i == "X" || i == "O"
       count += 1
    end
  end
  return count 
end




def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please choose a number 1-9:"
  input = gets.chomp
  i = input_to_index(input)
  if valid_move?(i)
    token = current_player
    move(i, token)
    display_board
  else
    turn
  end
end

def won?
  position = WIN_COMBINATIONS.find{
    |item|
    @board[item[0]] == "X" && @board[item[1]] == "X" && @board[item[2]] == "X"
  }
   positiontwo = WIN_COMBINATIONS.find{
    |x|
    @board[x[0]] == "O" && @board[x[1]] == "O" && @board[x[2]] == "O"
  }
   position || positiontwo
end

def full?
  @board.all? {|x| x == "X" || x == "O"}
end

def draw?
  if !won? && full?
  true
  else
  false
  end
end

def over?
  if won? || draw?
  true
  else
  false
  end
end


def winner
  if won?
    @board[won?[0]] == "X" ? "X" : "O"
  else
    return nil
  end
end




def play
  while !over?
    turn
  end
  if won?
    @winner = winner 
    puts 'Congratulations ' + @winner + "!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end





