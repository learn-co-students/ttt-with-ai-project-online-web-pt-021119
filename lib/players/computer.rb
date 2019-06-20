module Players

    class Computer < Player

        def move (board)
            board.find_empty_cells.sample.to_s
        end

        def almost_won?(board)
            comb_win=false
            posit_1=board.cells.map.with_index {|a,i|i if a==self.token}
            posit_2=board.cells.map.with_index {|a,i|i if a!=self.token}
            Game::WIN_COMBINATIONS.each do |a|
                if posit_1.select {|b|b==a[0] || b==a[1] || b==a[2]}.size == 2
                    # binding.pry
                    comb_win=(a-posit_1)[0]
                    board.cells[comb_win]!=" " ? break : comb_win=false 
                end
            end
            comb_win
        end



    end
end