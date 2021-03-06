class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
 	    [0, 1, 2], [3, 4, 5], [6, 7, 8],
 	    [0, 3, 6], [1, 4, 7], [2, 5, 8],
 	    [0, 4, 8], [2, 4, 6]
 	  ]


 	  def display_board                                     # changed [board] to
 	    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " # @board object
 	    puts "-----------"
 	    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 	    puts "-----------"
 	    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 	  end

    def input_to_index(user_input)
    user_input.to_i - 1
  end

def move(index, player)      # the InstanceVariable @board' calls? or writes?
	    @board[index] = player # line object initialized as [board] in code:rb3
	  end

    # def position_taken?(board, index)
    # board[index]== "X" || board[index] == "O"
def position_taken?(index)
      @board[index] != " "
    end

def valid_move?(index)
    	!position_taken?(index) && index.between?(0,8)
    end


  def turn_count
    	@board.count{|square| square != " " }
    end

  def current_player
      turn_count.even? ? "X" : "O"
    end

def turn
	    puts "Please enter a number (1-9):"
	    user_input = gets.strip
	    index = input_to_index(user_input)
	    if valid_move?(index)
    player = current_player
        move(index, player)
    else
    	  turn
    	end
    	 display_board
    	end

def won?
  WIN_COMBINATIONS.any? do |win_combo| # I redefined 'row' from procedural ruby solution rb:37  to 'win_combo' because it makes more sense
    if position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
    	return win_combo
    end
  end
end

def full?
      @board.all?{|square| square != " " }
    end


    def draw?
      full? && !won?
    end


    def over?
      won? || draw?
    end


    def winner
      if win_combo = won?
        @board[win_combo[0]]
      end
    end


  def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!" # don't know whatis 'Cats Game!' but added to pass rspec
      end
end
