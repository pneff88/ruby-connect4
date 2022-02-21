require_relative "../lib/board"
require_relative "../lib/player"


class Game
    attr_accessor :board, :player1, :player2

    def initialize 
        @board = Board.new
        @player1 = Player.new('X')
        @player2 = Player.new('Y')
        @current_player = @player1
        @board.print_board
        @game_over=false

    end

    def play
        while @game_over == false
            col = @current_player.get_position
            row = @board.find_row(col)
            @board.change_mark(@current_player.mark, row, col)
            @board.print_board
            if @board.win_row?(@current_player.mark, row, col) || @board.win_col?(@current_player.mark, row, col) || @board.win_dia?(@current_player.mark, row, col)
                puts "Congratulations! #{@current_player} is the winner!"
                @game_over = true
            else 
                if @current_player == @player1
                    @current_player = @player2
                else
                    @current_player = @player1
                end
            end
        end
    end
end

