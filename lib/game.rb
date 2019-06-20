class Game
    attr_accessor :board, :player_1, :player_2, :winner

    WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


    def initialize (player_1=Players::Human.new("X"), player_2=Players::Human.new("O"),board=Board.new)
        @board=board
        @player_1=player_1
        @player_2=player_2
    end

    def draw?
        board.full? && !won?
    end

    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def won?
        comb_win=false
        posit_1=board.cells.map.with_index {|a,i|i if a=="X"}
        posit_2=board.cells.map.with_index {|a,i|i if a=="O"}
        WIN_COMBINATIONS.each do |a|
            comb_win=a if a.all?{|b|posit_1.include?(b)}||a.all?{|b|posit_2.include?(b)}
        end
        comb_win
    end

    def over?
        draw? || won?
    end

    def winner
        winner1=nil
        posit_1=board.cells.map.with_index {|a,i|i if a=="X"}
        posit_2=board.cells.map.with_index {|a,i|i if a=="O"}
        WIN_COMBINATIONS.each do |a|
            if a.all?{|b|posit_1.include?(b)}
                winner1=player_1.token
            elsif a.all?{|b|posit_2.include?(b)}
                winner1=player_2.token
            end
        end
        winner1
    end

    def turn
        mov=""
        cur_player=current_player
        until @board.valid_move?(mov)
            puts "Please insert a valid move:" if cur_player.class=="Human"
            mov=cur_player.move(@board)

        end
        board.update(mov,cur_player)
    end

    def play
        until over?
            turn
            board.display
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

end 