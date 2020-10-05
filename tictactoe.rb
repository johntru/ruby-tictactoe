

class Board
    attr_accessor :game_board
    
    def initialize
        @game_board = Array.new(9, " ") #initialize empty game board
        @number_board = Array (1..9)    #board for displaying cell number
    end

    def display_board
        puts " #{@number_board[0]} | #{@number_board[1]} | #{@number_board[2]} "
        puts "-----------"
        puts " #{@number_board[3]} | #{@number_board[4]} | #{@number_board[5]} "
        puts "-----------"
        puts " #{@number_board[6]} | #{@number_board[7]} | #{@number_board[8]} "
        puts ""
        puts " #{@game_board[0]} | #{@game_board[1]} | #{@game_board[2]} "
        puts "-----------"
        puts " #{@game_board[3]} | #{@game_board[4]} | #{@game_board[5]} "
        puts "-----------"
        puts " #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]} "
    end

    def free_cell?(player)
        game_board[player.pick].include?(" ")
    end

    def correct_input?(player)
        player.pick >= 0 && player.pick <= 8
    end

end

class Player
    attr_accessor :name, :position, :pick

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @position = []
    end

    def play(board) #ask player to play and take their input 
                    #checks for correct input and if chosen cell is free
                    #input is then added onto game board
        puts "#{@name}! Choose an available position to play"
        @pick = gets.chomp.to_i-1
        until board.correct_input?(self)
            puts "Incorrect input. Pick a number between 1 and 9:"
            @pick = gets.chomp.to_i-1
        end
        until board.free_cell?(self)
            puts "Cell not free. Choose again!"
            @pick = gets.chomp.to_i-1
        end
        @position << @pick
        @position.each { |i| board.game_board[i] = @symbol } 
    end

end

class TicTacToe
    def initialize
        @player_1 = Player.new("Player 1", "X")
        @player_2 = Player.new("Player 2", "O")
        @board = Board.new
        @@win = false
    end

    @@winning_combos = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],
        [2,5,8]]

    def startGame   # game loop for turns between players 
                    # each turn includes play, displays board and checks for win
        puts @board.display_board
        while @@win == false
            if @@win == false
                @player_1.play(@board)
                puts @board.display_board
                check_win(@player_1)
            end
            if @@win == false 
                @player_2.play(@board)
                puts @board.display_board
                check_win(@player_2)
            end
        end
        playAgain?
    end

    def check_win(player)    #check if player currently has a winning combo
                             #win changes win condition to true
        if (@@winning_combos.map { |n| (n-player.position).empty? }).include?(true)
            @@win = true
            puts "#{player.name} has won!"
            puts ""
        end
    end

    def playAgain?     #ask players if they wish to play again with y/n input
        puts "Play again? Y/N?"
        input = gets.chomp.to_s
        if input.downcase == "y" || input.downcase == "yes"
            game = TicTacToe.new
            game.startGame
        elsif input.downcase == "n" || input.downcase == "no"
            puts "Thank you for playing!"
            exit
        else    #if input neither yes or no, ask again
            puts "I don't understand."
            playAgain?
        end
    end
end

game = TicTacToe.new
game.startGame

# new_board = Board.new    # initialize game board (class)
# puts new_board.display_board # display empty board to players (method)

# create player class which creates two players X and O (class and initlialize)


#first_turn = player_1.play(new_board)

# p player_1.position

# p new_board.game_board[3] 
# puts new_board.display_board 

# p new_board.game_board





# initialize game board (class)
# display empty board to players (method)

# create player class which creates two players X and O (class and initlialize)
# create player behaviour, who chooses position to play piece

# check to see if chosen position available and then add piece to position
# on board



# create game logic (TicTacToe) class which has winning and draw combinations
# win check constantly by seeing if positions on board include either all X or O
# in following positions on board
# [1,2,3], [4,5,6]


# TicTacToe class controls the game by interacting with Board and Player classes

