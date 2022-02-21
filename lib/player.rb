class Player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Player #{@mark.to_s}, enter the column you would like to play"
        col = gets.chomp.to_i
        raise "Sorry that was invalid" if col > 7
        col
    end
end