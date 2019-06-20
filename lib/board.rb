class Board
    attr_accessor :cells


    def initialize
        reset!
    end

    def reset!
        @cells=[]
        9.times do
            @cells<<" "
        end
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position (pos)
        @cells[pos.to_i-1]
    end 

    def update (pos, player)
        @cells[pos.to_i-1]=player.token
    end

    def full?
        !@cells.include?(" ")
    end

    def turn_count
        @cells.count {|a|a != " "}
    end

    def taken? (pos)
        @cells[pos.to_i-1]!=" "
    end

    def valid_move? (pos)
        !taken?(pos) && pos.to_i.between?(1,9)
    end

    def find_empty_cells
        @cells.map.with_index{|a,i|i if a==" "}
    end
  end 

