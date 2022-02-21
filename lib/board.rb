class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(6) { Array.new(7, '_' ) }
    end

    def print_board
        @grid.each_with_index do |row, i|
            row_num = 7-(i+1)
            puts "Row #{row_num}: #{row.join(' ')}"
        end
    end

    def change_mark(mark, row, col)
        self.grid[row][col] = mark
    end

    def win_row?(mark,row,col)
        current_row = self.grid[row]
        if current_row[col-1] == mark && current_row[col-2] == mark && current_row[col-3] == mark
            return true
        elsif current_row[col-1] == mark && current_row[col-2] == mark && current_row[col+1] == mark
            return true
        elsif current_row[col-1] == mark && current_row[col+1] == mark && current_row[col+2] == mark
            return true
        elsif current_row[col+1] == mark && current_row[col+2] == mark && current_row[col+3] == mark
            return true 
        else 
            return false
        end
    end

    def win_col?(mark,row,col)
        if row < 3
            if self.grid[row+1][col] == mark && self.grid[row+2][col] == mark && self.grid[row+3][col] == mark
                return true
            end
        else
            return false
        end
    end

    def win_dia?(mark,row,col)
        if self.grid[row-1] && self.grid[row-1][col-1] === mark && 
            self.grid[row-2] && self.grid[row-2][col-2] === mark &&
            self.grid[row-3] && self.grid[row-3][col-3] === mark
            return true
        elsif self.grid[row-1] && self.grid[row-1][col-1] === mark && 
            self.grid[row-2] && self.grid[row-2][col-2] === mark &&
            self.grid[row+1] && self.grid[row+1][col+1] === mark 
            return true
        elsif self.grid[row-1] && self.grid[row-1][col-1] === mark && 
            self.grid[row+2] && self.grid[row+2][col+2] === mark &&
            self.grid[row+1] && self.grid[row+1][col+1] === mark 
            return true
        elsif self.grid[row+1] && self.grid[row+1][col+1] === mark && 
            self.grid[row+2] && self.grid[row+2][col+2] === mark &&
            self.grid[row+3] && self.grid[row+3][col+3] === mark 
            return true

        elsif self.grid[row+3] && self.grid[row+3][col-3] === mark && 
            self.grid[row+2] && self.grid[row+2][col-2] === mark &&
            self.grid[row+1] && self.grid[row+1][col-1] === mark 
            return true
        elsif self.grid[row-1] && self.grid[row-1][col+1] === mark && 
            self.grid[row+2] && self.grid[row+2][col-2] === mark &&
            self.grid[row+1] && self.grid[row+1][col-1] === mark 
            return true
        elsif self.grid[row-1] && self.grid[row-1][col+1] === mark && 
            self.grid[row-2] && self.grid[row-2][col+2] === mark &&
            self.grid[row+1] && self.grid[row+1][col-1] === mark 
            return true
        elsif self.grid[row-1] && self.grid[row-1][col-1] === mark && 
            self.grid[row-2] && self.grid[row-2][col-2] === mark &&
            self.grid[row-3] && self.grid[row-3][col+3] === mark 
            return true
        else 
            return false
        end
    end

    def find_row(col)
        self.grid.each_with_index do |row,i|
            if row[col] != '_'
                return i-1
            end
        end
        return 5
    end

end