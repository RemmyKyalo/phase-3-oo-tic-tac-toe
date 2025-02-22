class TicTacToe
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
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
  
    def input_to_index(user_input)
      user_input.to_i - 1
    end
  
    def move(index, token = "X")
      @board[index] = token
    end
  
    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
    end
  
    def valid_move?(position)
        index = input_to_index(position)
        index.between?(0, 8) && !position_taken?(index)
      end
      
  
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
  
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
  
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(input)
        move(index, current_player)
        display_board
      else
        puts "Invalid move. Please try again."
        turn
      end
    end
  
    def won?
      WIN_COMBINATIONS.detect do |win_combination|
        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]
  
        position_1 == position_2 && position_2 == position_3 && position_taken?(win_combination[0])
      end
    end
  
    def full?
      @board.all? {|position| position == "X" || position == "O"}
    end
  
    def draw?
      full? && !won?
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      if winning_combo = won?
        @board[winning_combo.first]
      end
    end
  
    def play
      display_board
      until over?
        turn
      end
  
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
  end
  