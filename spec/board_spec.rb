require_relative "../lib/board"

describe Board do
    describe '#initialize' do
        context "when using default initialization"
        subject(:default_board) { Board.new }

        it "has the six rows" do
            expect(default_board.grid.length).to eq(6)
        end

        it "has rows that have 7 elements" do
            expect(default_board.grid[0].length).to eq(7)
        end

        it 'has elements of rows that are just underscores' do
            expect(default_board.grid[0][0]).to eq('_')
        end
    end

    describe '#find_row' do
        context 'when using default initialization & calling on 0' do
        subject(:default_board) { Board.new }

            it 'returns 5' do
                expect(default_board.find_row(0)).to eq(5)
            end
        end

        context 'when using board with two rows filled in col 0 & calling on 0' do
        subject(:default_board) {Board.new}

            it 'returns 3' do
                default_board.change_mark('X',5,0)
                default_board.change_mark('X',4,0)
                expect(default_board.find_row(0)).to eq(3)
            end
        end
    end

    describe '#win_row?' do
        context 'when row has not won' do
            subject(:default_board) { Board.new }
            it 'returns false' do
                default_board.change_mark('X',5,0)
                default_board.change_mark('X',5,1)
                default_board.change_mark('X',5,2)
                expect(default_board.win_row?('X',5,2)).to eq(false)
            end
        end
        context 'when row has won' do
            subject(:default_board) { Board.new }
            it 'returns true' do
                default_board.change_mark('X',5,0)
                default_board.change_mark('X',5,1)
                default_board.change_mark('X',5,2)
                default_board.change_mark('X',5,3)
                expect(default_board.win_row?('X',5,3)).to eq(true)
            end
        end
    end

    describe '#win_col?' do
        context 'when col has not won' do
            subject(:default_board) { Board.new }
            it 'returns false' do
                default_board.change_mark('X',5,0)
                default_board.change_mark('X',4,0)
                default_board.change_mark('X',3,0)
                expect(default_board.win_col?('X',3,0)).to eq(false)
            end
        end

        context 'when col has won' do 
            subject(:default_board) { Board.new }
            it 'returns true' do
                default_board.change_mark('X',5,0)
                default_board.change_mark('X',4,0)
                default_board.change_mark('X',3,0)
                default_board.change_mark('X',2,0)
                expect(default_board.win_col?('X',2,0)).to eq(true)
            end
        end
    end

    describe '#win_dia?' do
        context 'when dia has not won' do
            subject(:default_board) { Board.new }
            it 'returns false' do
                default_board.change_mark('X',0,0)
                default_board.change_mark('X',1,1)
                default_board.change_mark('X',2,2)
                expect(default_board.win_dia?('X',2,2)).to eq(false)
            end
        end
        context 'when dia has won' do
            subject(:default_board) { Board.new }
            it 'returns true' do
                default_board.change_mark('X',0,0)
                default_board.change_mark('X',1,1)
                default_board.change_mark('X',2,2)
                default_board.change_mark('X',3,3)
                expect(default_board.win_dia?('X',3,3)).to eq(true)
            end
        end
        context 'when dia has won up to the right' do
            subject(:default_board) { Board.new }
            it 'returns true' do
                default_board.change_mark('X',4,2)
                default_board.change_mark('X',2,4)
                default_board.change_mark('X',1,5)
                default_board.change_mark('X',3,3)
                expect(default_board.win_dia?('X',3,3)).to eq(true)
            end
        end
    end


end