class ConnectFour
  def initialize(board = Array.new(42, " "))
     @board = board
  end

  COLUMN_1 = [0, 6, 12, 18, 24, 30, 36]
  COLUMN_2 = [1, 7, 13, 19, 25, 31, 37]
  COLUMN_3 = [2, 8, 14, 20, 26, 32, 38]
  COLUMN_4 = [3, 9, 15, 21, 27, 33, 39]
  COLUMN_5 = [4, 10, 16, 22, 28, 34, 40]
  COLUMN_6 = [5, 11, 17, 23, 29, 35, 41]

  WIN_COMBINATIONS = [
    #ROWS
    #ROW 1
    [0, 1, 2, 3],
    [1, 2, 3, 4],
    [2, 3, 4, 5],
    #ROW 2
    [6, 7, 8, 9],
    [7, 8, 9, 10],
    [8, 9, 10, 11],
    #ROW 3
    [12, 13, 14, 15],
    [13, 14, 15, 16],
    [14, 15, 16, 17],
    #ROW 4
    [18, 19, 20, 21],
    [19, 20, 21, 22],
    [20, 21, 22, 23],
    #ROW 5
    [24, 25, 26, 27],
    [25, 26, 27, 28],
    [26, 27, 28, 29],
    #ROW 6
    [30, 31, 32, 33],
    [31, 32, 33, 34],
    [32, 33, 34, 35],
    #ROW 7
    [36, 37, 38, 39],
    [37, 38, 39, 40],
    [38, 39, 40, 41],
    #COLUMNS
    #COLUMN 1
    [0, 6, 12, 18],
    [6, 12, 18, 24],
    [12, 18, 24, 30],
    [18, 24, 30, 36],
    #COLUMN 2
    [1, 7, 13, 19],
    [7, 13, 19, 25],
    [13, 19, 25, 31],
    [19, 25, 31, 37],
    #COLUMN 3
    [2, 8, 14, 20],
    [8, 14, 20, 26],
    [14, 20, 26, 32],
    [20, 26, 32, 38],
    #COLUMN 4
    [3, 9, 15, 21],
    [9, 15, 21, 27],
    [15, 21, 27, 33],
    [21, 27, 33, 39],
    #COLUMN 5
    [4, 10, 16, 22],
    [10, 16, 22, 28],
    [16, 22, 28, 34],
    [22, 28, 34, 40],
    #COLUMN 6
    [5, 11, 17, 23],
    [11, 17, 23, 29],
    [17, 23, 29, 35],
    [23, 29, 35, 41],
    #DIAGONALS
    #DIAGONAL TO BOTTOM RIGHT
    [2, 9, 16, 23],
    [1, 8, 15, 22],
    [8, 15, 22, 29],
    [0, 7, 14, 21],
    [7, 14, 21, 28],
    [14, 21, 28, 35],
    [6, 13, 20, 27],
    [13, 20, 27, 34],
    [20, 27, 34, 41],
    [12, 19, 26, 33],
    [19, 26, 33, 40],
    [18, 25, 32, 39],
    #DIAGONAL TO TOP RIGHT
    [3, 8, 13, 18],
    [4, 9, 14, 19],
    [9, 14, 19, 24],
    [5, 10, 15, 20],
    [10, 15, 20, 25],
    [15, 20, 25, 30],
    [11, 16, 21, 26],
    [16, 21, 26, 31],
    [21, 26, 31, 36],
    [17, 22, 27, 32],
    [22, 27, 32, 37],
    [23, 28, 33, 38]
  ]
  FIVE_COMBINATIONS = [
    #HORIZONTAL
    [0, 1, 2, 3, 4],
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [7, 8, 9, 10, 11],
    [12, 13, 14, 15, 16],
    [13, 14, 15, 16, 17],
    [18, 19, 20, 21, 22],
    [19, 20, 21, 22, 23],
    [24, 25, 26, 27, 28],
    [25, 26, 27, 28, 29],
    [30, 31, 32, 33, 34],
    [31, 32, 33, 34, 35],
    [36, 37, 38, 39, 40],
    [37, 38, 39, 40, 41],
    #VERTICAL NOT POSSIBLE
    #DIAGONAL TO TOP RIGHT
    [36, 31, 26, 21, 16],
    [31, 26, 21, 16, 11],
    [37, 32, 27, 22, 17],
    [5, 10, 15, 20, 25],
    [10, 15, 20, 25, 30],
    [24, 19, 14, 9, 4],
    #DIAGONAL TO BOTTOM RIGHT
    [1, 8, 15, 22, 29],
    [0, 7, 14, 21, 28],
    [7, 14, 21, 28, 35],
    [6, 13, 20, 27, 34],
    [13, 20, 27, 34, 41],
    [12, 19, 26, 33, 40]
  ]

  #HELPER METHODS
  def display_board(board)
    puts ""
    puts ""
    puts "| 1 | 2 | 3 | 4 | 5 | 6 |"
    puts "|---|---|---|---|---|---|"
    puts "| #{board[0]} | #{board[1]} | #{board[2]} | #{board[3]} | #{board[4]} | #{board[5]} |"
    puts "| #{board[6]} | #{board[7]} | #{board[8]} | #{board[9]} | #{board[10]} | #{board[11]} |"
    puts "| #{board[12]} | #{board[13]} | #{board[14]} | #{board[15]} | #{board[16]} | #{board[17]} |"
    puts "| #{board[18]} | #{board[19]} | #{board[20]} | #{board[21]} | #{board[22]} | #{board[23]} |"
    puts "| #{board[24]} | #{board[25]} | #{board[26]} | #{board[27]} | #{board[28]} | #{board[29]} |"
    puts "| #{board[30]} | #{board[31]} | #{board[32]} | #{board[33]} | #{board[34]} | #{board[35]} |"
    puts "| #{board[36]} | #{board[37]} | #{board[38]} | #{board[39]} | #{board[40]} | #{board[41]} |"
    puts ""
    puts""
  end

def move(column, token, board)
  @board[column_to_index(column, board)] = token
end

def empty_spaces_in_column(column, board)
  return column.select{ |i| (board[i] == " ") || (board[i] == "") }
end

def token_will_land_when_dropped(column, board)
  return column[empty_spaces_in_column(column, board).length - 1]
end

def column_to_index(column, board)
  if column == 1
    token_will_land_when_dropped(COLUMN_1, board)
  elsif column == 2
    token_will_land_when_dropped(COLUMN_2, board)
  elsif column == 3
    token_will_land_when_dropped(COLUMN_3, board)
  elsif column == 4
    token_will_land_when_dropped(COLUMN_4, board)
  elsif column == 5
    token_will_land_when_dropped(COLUMN_5, board)
  elsif column == 6
    token_will_land_when_dropped(COLUMN_6, board)
  end
end

  def position_taken?(column, board)
    if board[column_to_index(column, board)] == "" || board[column_to_index(column, board)] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(column, board)
    if column != nil
      if column >= 1 && column <= 6
        if position_taken?(column, board) == false
          return true
        else
          return false
        end
      else
        return false
      end
    end
  end

  def turn
    token = current_player(turn_count)
    puts "------------------------"
    if @computer_game.upcase == "N" || @computer_game.upcase == "NO"
      if token == "X".yellow
        puts "   X'S TURN  ".yellow
        puts""
      else
        puts "   O'S TURN  ".red
        puts""
      end
    else
    puts "       YOUR TURN       ".yellow
    puts""
    end
    puts "SELECT A COLUMN"
    column = gets.chomp.to_i
    if valid_move?(column, @board) == true
      move(column, token, @board)
      display_board(@board)
    else
      puts "INVALID MOVE".blue
      turn
    end
  end

  def computer_turn
    @token = current_player(turn_count)
    @opponent_token = current_player(turn_count + 1)

    puts "------------------------"
    puts "       RUBY'S TURN      ".red
    puts""
    puts'     \ ______/ V`-,'.red
    puts'      }        /~~'.red
    puts'     /_)^ --,r'.red
    puts'    |_|      |_| '.red
    puts""
    sleep(0.5)

    def generate_move_options(previous_board)
      if previous_board != nil
        return [
          if valid_move?(1, previous_board) != nil && valid_move?(1, previous_board) != false
            token_will_land_when_dropped(COLUMN_1, previous_board)
          else nil
          end,
          if valid_move?(2, previous_board) != nil && valid_move?(2, previous_board) != false
            token_will_land_when_dropped(COLUMN_2, previous_board)
          else nil
          end,
          if valid_move?(3, previous_board) != nil && valid_move?(3, previous_board) != false
            token_will_land_when_dropped(COLUMN_3, previous_board)
          else nil
          end,
          if valid_move?(4, previous_board) != nil && valid_move?(4, previous_board) != false
            token_will_land_when_dropped(COLUMN_4, previous_board)
          else nil
          end,
          if valid_move?(5, previous_board) != nil && valid_move?(5, previous_board) != false
            token_will_land_when_dropped(COLUMN_5, previous_board)
          else nil
          end,
          if valid_move?(6, previous_board) != nil && valid_move?(6, previous_board) != false
            token_will_land_when_dropped(COLUMN_6, previous_board)
          else nil
          end
        ]
      else nil
      end
    end

    def generate_boards(previous_board, current_move_options, token)
      if current_move_options != nil
        return [
        if current_move_options[0] != nil
          computer_board_option = previous_board.clone
          computer_board_option[current_move_options[0]] = token
          computer_board_option
        end,
        if current_move_options[1] != nil
          computer_board_option = previous_board.clone
          computer_board_option[current_move_options[1]] = token
          computer_board_option
        end,
        if current_move_options[2] != nil
          computer_board_option = previous_board.clone
          computer_board_option[current_move_options[2]] = token
          computer_board_option
        end,
        if current_move_options[3] != nil
          computer_board_option = previous_board.clone
          computer_board_option[current_move_options[3]] = token
          computer_board_option
        end,
        if current_move_options[4] != nil
          computer_board_option = previous_board.clone
          computer_board_option[current_move_options[4]] = token
          computer_board_option
        end,
        if current_move_options[5] != nil
          computer_board_option = previous_board.clone
          computer_board_option[current_move_options[5]] = token
          computer_board_option
        end
      ]
      else nil
      end
    end

    def generate_board_scores(boards_to_be_evaluated, token, opponent_token)
      if boards_to_be_evaluated != nil
        return [
          if boards_to_be_evaluated[0] != nil
            board_score(boards_to_be_evaluated[0], token, opponent_token)
          end,
          if boards_to_be_evaluated[1] != nil
            board_score(boards_to_be_evaluated[1], token, opponent_token)
          end,
          if boards_to_be_evaluated[2] != nil
            board_score(boards_to_be_evaluated[2], token, opponent_token)
          end,
          if boards_to_be_evaluated[3] != nil
            board_score(boards_to_be_evaluated[3], token, opponent_token)
          end,
          if boards_to_be_evaluated[4] != nil
            board_score(boards_to_be_evaluated[4], token, opponent_token)
          end,
          if boards_to_be_evaluated[5] != nil
            board_score(boards_to_be_evaluated[5], token, opponent_token)
          end,
        ]
      else nil
      end
    end

    def remove_nils(boards)
      i = boards.clone
      i.delete(nil)
      return i
    end

    def avg_board_scores(boards)
      if boards != nil
        nonils = remove_nils(boards)
        z = nonils.sum(0.0) / nonils.size
        return z.to_f
      else nil
      end
    end

    def max_board_scores(boards)
      if boards != nil
        nonils = remove_nils(boards)
        max = nonils.max
        return max
      else nil
      end
    end

    def min_board_scores(boards)
    if boards != nil
      nonils = remove_nils(boards)
      min = nonils.min
      return min
    else nil
    end
  end










    # initialize fake boards
    computer_board_option_1 = @board.clone
    computer_board_option_2 = @board.clone
    computer_board_option_3 = @board.clone
    computer_board_option_4 = @board.clone
    computer_board_option_5 = @board.clone
    computer_board_option_6 = @board.clone



    # Search the board for possible moves
    move_options = [
      if valid_move?(1, @board) == true
        token_will_land_when_dropped(COLUMN_1, @board)
      end,
      if valid_move?(2, @board) == true
        token_will_land_when_dropped(COLUMN_2, @board)
      end,
      if valid_move?(3, @board) == true
        token_will_land_when_dropped(COLUMN_3, @board)
      end,
      if valid_move?(4, @board) == true
        token_will_land_when_dropped(COLUMN_4, @board)
      end,
      if valid_move?(5, @board) == true
        token_will_land_when_dropped(COLUMN_5, @board)
      end,
      if valid_move?(6, @board) == true
        token_will_land_when_dropped(COLUMN_6, @board)
      end
    ]

    #update fake boards to make moves for every array
    if valid_move?(1, @board) == true
      computer_board_option_1[move_options[0]] = @token
    end
    if valid_move?(2, @board) == true
      computer_board_option_2[move_options[1]] = @token
    end
    if valid_move?(3, @board) == true
      computer_board_option_3[move_options[2]] = @token
    end
    if valid_move?(4, @board) == true
      computer_board_option_4[move_options[3]] = @token
    end
    if valid_move?(5, @board) == true
      computer_board_option_5[move_options[4]] = @token
    end
    if valid_move?(6, @board) == true
      computer_board_option_6[move_options[5]] = @token
    end





    # evaluate moves
    # if winning space, take it
    if won?(computer_board_option_1)
      # puts "MOVE TYPE: Take winning move"
      # puts "COLUMN SELECTED: Column 1"
      move(1, @token, @board)
      display_board(@board)
    elsif won?(computer_board_option_2)
      # puts "MOVE TYPE: Take winning move"
      # puts "COLUMN SELECTED: Column 2"
      move(2, @token, @board)
      display_board(@board)
    elsif won?(computer_board_option_3)
      # puts "MOVE TYPE: Take winning move"
      # puts "COLUMN SELECTED: Column 3"
      move(3, @token, @board)
      display_board(@board)
    elsif won?(computer_board_option_4)
      # puts "MOVE TYPE: Take winning move"
      # puts "COLUMN SELECTED: Column 4"
      move(4, @token, @board)
      display_board(@board)
    elsif won?(computer_board_option_5)
      # puts "MOVE TYPE: Take winning move"
      # puts "COLUMN SELECTED: Column 5"
      move(5, @token, @board)
      display_board(@board)
    elsif won?(computer_board_option_6)
      # puts "MOVE TYPE: Take winning move"
      # puts "COLUMN SELECTED: Column 6"
      move(6, @token, @board)
      display_board(@board)
    else

      # reset boards
      computer_board_option_1 = @board.clone
      computer_board_option_2 = @board.clone
      computer_board_option_3 = @board.clone
      computer_board_option_4 = @board.clone
      computer_board_option_5 = @board.clone
      computer_board_option_6 = @board.clone

      #update boards for moves opponent could make
      if valid_move?(1, @board) == true
        computer_board_option_1[move_options[0]] = @opponent_token
      end
      if valid_move?(2, @board) == true
        computer_board_option_2[move_options[1]] = @opponent_token
      end
      if valid_move?(3, @board) == true
        computer_board_option_3[move_options[2]] = @opponent_token
      end
      if valid_move?(4, @board) == true
        computer_board_option_4[move_options[3]] = @opponent_token
      end
      if valid_move?(5, @board) == true
        computer_board_option_5[move_options[4]] = @opponent_token
      end
      if valid_move?(6, @board) == true
        computer_board_option_6[move_options[5]] = @opponent_token
      end

      #if opponent can win in their next move, take that space
      if won?(computer_board_option_1)
        # puts "MOVE TYPE: Take opponent's winning move"
        # puts "COLUMN SELECTED: Column 1"
        move(1, @token, @board)
        display_board(@board)
      elsif won?(computer_board_option_2)
        # puts "MOVE TYPE: Take opponent's winning move"
        # puts "COLUMN SELECTED: Column 2"
        move(2, @token, @board)
        display_board(@board)
      elsif won?(computer_board_option_3)
        # puts "MOVE TYPE: Take opponent's winning move"
        # puts "COLUMN SELECTED: Column 3"
        move(3, @token, @board)
        display_board(@board)
      elsif won?(computer_board_option_4)
        # puts "MOVE TYPE: Take opponent's winning move"
        # puts "COLUMN SELECTED: Column 4"
        move(4, @token, @board)
        display_board(@board)
      elsif won?(computer_board_option_5)
        # puts "MOVE TYPE: Take opponent's winning move"
        # puts "COLUMN SELECTED: Column 5"
        move(5, @token, @board)
        display_board(@board)
      elsif won?(computer_board_option_6)
        # puts "MOVE TYPE: Take opponent's winning move"
        # puts "COLUMN SELECTED: Column 6"
        move(6, @token, @board)
        display_board(@board)
      else



      ###### NEW!
# #T1
      # puts "T1"
      # puts "-------"
      t1_move_options = generate_move_options(@board)
      t1_boards = generate_boards(@board, t1_move_options, @token)
      t1_evaluation = generate_board_scores(t1_boards, @token, @opponent_token)
      t1_avg = avg_board_scores(t1_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t1_move_options}"
      # puts "MOVE SCORES #{t1_evaluation}"
      # puts "MOVE SCORE AVG #{t1_avg}"
      # puts "-------"
#
#
# #T2
      # puts "T2, T1[0]"
      # puts "-------"
      t2_t1_0_move_options = generate_move_options(t1_boards[0])
      t2_t1_0_boards = generate_boards(t1_boards[0], t2_t1_0_move_options, @opponent_token)
      t2_t1_0_evaluation = generate_board_scores(t2_t1_0_boards, @token, @opponent_token)
      t2_t1_0_avg = avg_board_scores(t2_t1_0_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t2_t1_0_move_options}"
      # puts "MOVE SCORES #{t2_t1_0_evaluation}"
      # puts "MOVE SCORE AVG #{t2_t1_0_avg}"
      # puts "-------"
      #
      #
      # puts "T2, T1[1]"
      # puts "-------"
      t2_t1_1_move_options = generate_move_options(t1_boards[1])
      t2_t1_1_boards = generate_boards(t1_boards[1], t2_t1_1_move_options, @opponent_token)
      t2_t1_1_evaluation = generate_board_scores(t2_t1_1_boards, @token, @opponent_token)
      t2_t1_1_avg = avg_board_scores(t2_t1_1_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t2_t1_1_move_options}"
      # puts "MOVE SCORES #{t2_t1_1_evaluation}"
      # puts "MOVE SCORE AVG #{t2_t1_1_avg}"
      # puts "-------"
      #
      #
      # puts "T2, T1[2]"
      # puts "-------"
      t2_t1_2_move_options = generate_move_options(t1_boards[2])
      t2_t1_2_boards = generate_boards(t1_boards[2], t2_t1_2_move_options, @opponent_token)
      t2_t1_2_evaluation = generate_board_scores(t2_t1_2_boards, @token, @opponent_token)
      t2_t1_2_avg = avg_board_scores(t2_t1_2_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t2_t1_2_move_options}"
      # puts "MOVE SCORES #{t2_t1_2_evaluation}"
      # puts "MOVE SCORE AVG #{t2_t1_2_avg}"
      # puts "-------"
      #
      #
      # puts "T2, T1[3]"
      # puts "-------"
      t2_t1_3_move_options = generate_move_options(t1_boards[3])
      t2_t1_3_boards = generate_boards(t1_boards[3], t2_t1_3_move_options, @opponent_token)
      t2_t1_3_evaluation = generate_board_scores(t2_t1_3_boards, @token, @opponent_token)
      t2_t1_3_avg = avg_board_scores(t2_t1_3_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t2_t1_3_move_options}"
      # puts "MOVE SCORES #{t2_t1_3_evaluation}"
      # puts "MOVE SCORE AVG #{t2_t1_3_avg}"
      # puts "-------"
      #
      #
      # puts "T2, T1[4]"
      # puts "-------"
      t2_t1_4_move_options = generate_move_options(t1_boards[4])
      t2_t1_4_boards = generate_boards(t1_boards[4], t2_t1_4_move_options, @opponent_token)
      t2_t1_4_evaluation = generate_board_scores(t2_t1_4_boards, @token, @opponent_token)
      t2_t1_4_avg = avg_board_scores(t2_t1_4_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t2_t1_4_move_options}"
      # puts "MOVE SCORES #{t2_t1_4_evaluation}"
      # puts "MOVE SCORE AVG #{t2_t1_4_avg}"
      # puts "-------"
      #
      #
      # puts "T2, T1[5]"
      # puts "-------"
      t2_t1_5_move_options = generate_move_options(t1_boards[5])
      t2_t1_5_boards = generate_boards(t1_boards[5], t2_t1_5_move_options, @opponent_token)
      t2_t1_5_evaluation = generate_board_scores(t2_t1_5_boards, @token, @opponent_token)
      t2_t1_5_avg = avg_board_scores(t2_t1_5_evaluation)

      # puts "AVAILABLE MOVE OPTIONS #{t2_t1_5_move_options}"
      # puts "MOVE SCORES #{t2_t1_5_evaluation}"
      # puts "MOVE SCORE AVG #{t2_t1_5_avg}"
      # puts "-------"


# T3
      # puts "-------"
      # puts "T3"
      # puts "-------"




      def depth3(previousboard)
        if previousboard != nil
          # puts "-------"
          move_options = generate_move_options(previousboard)
          currentboards = generate_boards(previousboard, move_options, @token)
          evaluation = generate_board_scores(currentboards, @token, @opponent_token)
          av = avg_board_scores(evaluation)
          max = max_board_scores(evaluation)
          # puts "AVAILABLE MOVE OPTIONS #{move_options}"
          # puts "MOVE SCORES #{evaluation}"
          # puts "MOVE SCORE AVG #{av}"
          # puts "MOVE SCORE MAX #{max}"
          # puts "-------"
          # return av
          return av
        else nil
        end
      end

if t2_t1_0_boards != nil
  if valid_move?(1, @board) == true
  @max1 = [
    depth3(t2_t1_0_boards[0]),
    depth3(t2_t1_0_boards[1]),
    depth3(t2_t1_0_boards[2]),
    depth3(t2_t1_0_boards[3]),
    depth3(t2_t1_0_boards[4]),
    depth3(t2_t1_0_boards[5])
  ]
  else nil
  end
  else nil
  end

if t2_t1_1_boards != nil
  if valid_move?(2, @board) == true
  @max2 = [
    depth3(t2_t1_1_boards[0]),
    depth3(t2_t1_1_boards[1]),
    depth3(t2_t1_1_boards[2]),
    depth3(t2_t1_1_boards[3]),
    depth3(t2_t1_1_boards[4]),
    depth3(t2_t1_1_boards[5])
  ]
else nil
end
else nil
end

if t2_t1_2_boards != nil
  if valid_move?(3, @board) == true
  @max3 = [
    depth3(t2_t1_2_boards[0]),
    depth3(t2_t1_2_boards[1]),
    depth3(t2_t1_2_boards[2]),
    depth3(t2_t1_2_boards[3]),
    depth3(t2_t1_2_boards[4]),
    depth3(t2_t1_2_boards[5])
  ]
else nil
end
else nil
end

if t2_t1_3_boards != nil
  if valid_move?(4, @board) == true
  @max4 = [
    depth3(t2_t1_3_boards[0]),
    depth3(t2_t1_3_boards[1]),
    depth3(t2_t1_3_boards[2]),
    depth3(t2_t1_3_boards[3]),
    depth3(t2_t1_3_boards[4]),
    depth3(t2_t1_3_boards[5])
  ]
else nil
end
else nil
end

if t2_t1_4_boards != nil
  if valid_move?(5, @board) == true
  @max5 = [
    depth3(t2_t1_4_boards[0]),
    depth3(t2_t1_4_boards[1]),
    depth3(t2_t1_4_boards[2]),
    depth3(t2_t1_4_boards[3]),
    depth3(t2_t1_4_boards[4]),
    depth3(t2_t1_4_boards[5])
  ]
else nil
end
else nil
end

if t2_t1_5_boards != nil
  if valid_move?(6, @board) == true
  @max6 = [
    depth3(t2_t1_5_boards[0]),
    depth3(t2_t1_5_boards[1]),
    depth3(t2_t1_5_boards[2]),
    depth3(t2_t1_5_boards[3]),
    depth3(t2_t1_5_boards[4]),
    depth3(t2_t1_5_boards[5])
  ]
else nil
end
else nil
end

      # new_t1_evaluation = [avg_board_scores(@avg1), avg_board_scores(@avg2), avg_board_scores(@avg3), avg_board_scores(@avg4), avg_board_scores(@avg5), avg_board_scores(@avg6)]
      new_t1_evaluation = [
        if valid_move?(1, @board)
          avg_board_scores(@max1)
        else nil
        end,
        if valid_move?(2, @board)
          avg_board_scores(@max2)
        else nil
        end,
        if valid_move?(3, @board)
          avg_board_scores(@max3)
        else nil
        end,
        if valid_move?(4, @board)
          avg_board_scores(@max4)
        else nil
        end,
        if valid_move?(5, @board)
          avg_board_scores(@max5)
        else nil
        end,
        if valid_move?(6, @board)
          avg_board_scores(@max6)
        else nil
        end
      ]
      # puts "THE NEW MOVE SCORES WHEN LOOKING AT T3 ARE: #{new_t1_evaluation}"

      if new_t1_evaluation.uniq.length != 1
        nonils = remove_nils(new_t1_evaluation)
        best_move = nonils.max
        input = new_t1_evaluation.index(best_move) + 1
        if new_t1_evaluation.count(best_move) == 1
          # puts "MOVE TYPE: Pick the max score. Only one max."
          # puts "COLUMN SELECTED: #{input}"
          move(input, @token, @board)
          display_board(@board)
        else
          # puts "MOVE TYPE: Pick the max score. There are multiple max."
          # make array of best move locations
          move_options = new_t1_evaluation.each_index.select{|i| new_t1_evaluation[i] == best_move}
          move_options.map!{|i| i + 1}
          # puts "OPTIONS TO RANDOMLY SELECTR FROM: #{move_options}"

          # randomly pick a spot
          random_move_selection = rand(move_options.count)
          move_selected = move_options[random_move_selection]
          # puts "COLUMN SELECTED: #{move_selected}"
          move(move_selected, @token, @board)
          display_board(@board)

        end
      else

# otherwise random
      def generate_random_number(token)
        center_random = rand(2) + 1

        def centered?(center_random)
          if center_random == 1
            return true
          else
            return false
          end
        end

        # puts "Play in Columns 2 - 5 ?: #{centered?(center_random)}"

        if centered?(center_random) == true
          random = rand(4) + 1
          # puts "Random number 2 - 5 generated: #{random}"
          if valid_move?(random, @board)
            move(random, @token, @board)
            display_board(@board)
          else
            # puts "Regenerating random number"
            generate_random_number(token)
          end
        else
        random = rand(6) + 1
        # puts "Random number 1-6 generated: #{random}"
        if valid_move?(random, @board)
          move(random, @token, @board)
          display_board(@board)

        else
          # puts "Regenerating random number"
          generate_random_number(@token)
        end
      end

      end

      # puts "MOVE TYPE: Generate random number"
      generate_random_number(@token)

      #user input for now until I can automate
      # column = gets.chomp.to_i
      #   if valid_move?(column) == true
      #     move(column, token)
      #     display_board(@board)
      #   else
      #     puts "INVALID MOVE"
      #     turn
      #   end



      end
    end
  end
    # end
    # end
  end


  def turn_count
    moves_made = @board.select do |i|
      i == "X".yellow || i =="O".red
    end
    return moves_made.length
  end

  def current_player(turn)
    if turn % 2 == 0
      return "X".yellow
    else
      return "O".red
    end
  end

  def won?(board)
    WIN_COMBINATIONS.find do |i|
      board[i[0]] == board[i[1]] &&
      board[i[1]] == board[i[2]] &&
      board[i[2]] == board[i[3]] &&
      board[i[0]] != " "
    end
  end

  def three_in_a_row_first_available?(board, token)
    WIN_COMBINATIONS.find do |i|
      board[i[0]] == " " &&
      board[i[1]] == token &&
      board[i[2]] == token &&
      board[i[3]] == token
    end
  end

  def three_in_a_row_second_available?(board, token)
    WIN_COMBINATIONS.find do |i|
      board[i[0]] == token &&
      board[i[1]] == " " &&
      board[i[2]] == token &&
      board[i[3]] == token
    end
  end

  def three_in_a_row_third_available?(board, token)
    WIN_COMBINATIONS.find do |i|
      board[i[0]] == token &&
      board[i[1]] == token &&
      board[i[2]] == " " &&
      board[i[3]] == token
    end
  end

  def three_in_a_row_fourth_available?(board, token)
    WIN_COMBINATIONS.find do |i|
      board[i[0]] == token &&
      board[i[1]] == token &&
      board[i[2]] == token &&
      board[i[3]] == " "
    end
  end

  def three_in_a_row_first_last_available?(board, token)
    FIVE_COMBINATIONS.find do |i|
      board[i[0]] == " " &&
      board[i[1]] == token &&
      board[i[2]] == token &&
      board[i[3]] == token &&
      board[i[4]] == " "
    end
  end

  def board_score(board, token, opponent_token)
    score = 0
    num_three_first_avail_mine = WIN_COMBINATIONS.count do |i|
      board[i[0]] == " " &&
      board[i[1]] == token &&
      board[i[2]] == token &&
      board[i[3]] == token
    end
    num_three_second_avail_mine = WIN_COMBINATIONS.count do |i|
      board[i[0]] == token &&
      board[i[1]] == " " &&
      board[i[2]] == token &&
      board[i[3]] == token
    end
    num_three_third_avail_mine = WIN_COMBINATIONS.count do |i|
      board[i[0]] == token &&
      board[i[1]] == token &&
      board[i[2]] == " " &&
      board[i[3]] == token
    end
    num_three_fourth_avail_mine = WIN_COMBINATIONS.count do |i|
      board[i[0]] == token &&
      board[i[1]] == token &&
      board[i[2]] == token &&
      board[i[3]] == " "
    end
    num_wins_mine = WIN_COMBINATIONS.count do |i|
      board[i[0]] == token &&
      board[i[1]] == token &&
      board[i[2]] == token &&
      board[i[3]] == token
    end
    num_three_first_avail_opponent = WIN_COMBINATIONS.count do |i|
      board[i[0]] == " " &&
      board[i[1]] == opponent_token &&
      board[i[2]] == opponent_token &&
      board[i[3]] == opponent_token
    end
    num_three_second_avail_opponent = WIN_COMBINATIONS.count do |i|
      board[i[0]] == opponent_token &&
      board[i[1]] == " " &&
      board[i[2]] == opponent_token &&
      board[i[3]] == opponent_token
    end
    num_three_third_avail_opponent = WIN_COMBINATIONS.count do |i|
      board[i[0]] == opponent_token &&
      board[i[1]] == opponent_token &&
      board[i[2]] == " " &&
      board[i[3]] == opponent_token
    end
    num_three_fourth_avail_opponent = WIN_COMBINATIONS.count do |i|
      board[i[0]] == opponent_token &&
      board[i[1]] == opponent_token &&
      board[i[2]] == opponent_token &&
      board[i[3]] == " "
    end
    num_wins_opponent = WIN_COMBINATIONS.count do |i|
      board[i[0]] == opponent_token &&
      board[i[1]] == opponent_token &&
      board[i[2]] == opponent_token &&
      board[i[3]] == opponent_token
    end
    score = (num_wins_mine * 100) + num_three_first_avail_mine + num_three_second_avail_mine + num_three_third_avail_mine + num_three_fourth_avail_mine - (num_wins_opponent * 100) - num_three_first_avail_opponent - num_three_second_avail_opponent - num_three_third_avail_opponent - num_three_fourth_avail_opponent
    return score
  end

  def full?
    if turn_count >= 42
      return true
    else
      return false
    end
  end

  def draw?
    if !won?(@board) && full? == true
      return true
    else
      return false
    end
  end

  def over?
    if !won?(@board) == false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    if won?(@board).class == Array
      return @board[won?(@board)[0]]
    else
      return nil
    end
  end

  def play_again?
    puts ""
    puts ""
    puts "-----------------------------------"
    puts "WOULD YOU LIKE TO PLAY AGAIN? (Y/N)".blue
    puts "-----------------------------------"
    again = gets.chomp
    if again.upcase == "N" || again.upcase == "NO"
      nil
    elsif again.upcase == "Y" || again.upcase == "YES"
      puts ""
      puts "
      "
      game = ConnectFour.new
      game.play
    else
      puts "INVALID RESPONSE".blue
      play_again?
    end
  end

  def play
    puts""
    puts""
    puts"WELCOME TO".red
    puts"----------"
    puts""
    puts'    ____  __  ________  ___                  '
    puts'   / __ \/ / / / __ ) \/ ( )_____            '
    puts'  / /_/ / / / / __  |\  /|// ___/            '
    puts' / _, _/ /_/ / /_/ / / /  (__  )             '
    puts'/_/_|_|\____/_____/_/_/  /____/______________'
    puts'  / ____/ __ \/ | / / | / / ____/ ____/_  __/'
    puts' / /   / / / /  |/ /  |/ / __/ / /     / /   '
    puts'/ /___/ /_/ / /|  / /|  / /___/ /___  / /    '
    puts'\____/\____/_/ |_/_/_|_/_____/\____/ /_/     '
    puts'   / ____/ __ \/ / / / __ \                  '
    puts'  / /_  / / / / / / / /_/ /                  '
    puts' / __/ / /_/ / /_/ / _, _/                   '
    puts'/_/    \____/\____/_/ |_|                    '
    puts""
    puts""
    puts "--------------------------------------------------------"
    puts "  DO YOU WANT TO PLAY AGAINST RUBY THE ROBO-DOG? (Y/N) ".red
    puts "--------------------------------------------------------"
    @computer_game = gets.chomp
    if @computer_game.upcase == "N" || @computer_game.upcase == "NO"

      puts "----------------"
      puts "TWO PLAYER GAME!"
      puts "----------------"
      display_board(@board)
      until over? == true
        turn
      end

      if !won?(@board) == false
        puts "-------------------"
        puts "  CONGRATULATIONS  ".blue
        puts "-------------------"
        puts "  #{winner} WON THE GAME!  ".blue
        puts "-------------------"
      elsif draw?
        puts "-----------------------"
        puts "IT'S A DRAW, NOBODY WON".blue
        puts "-----------------------"
      end
  elsif @computer_game.upcase == "Y" || @computer_game.upcase == "YES"
    puts""
    puts""
    puts"-------------------------"
    puts"  RUBY'S READY TO PLAY!  ".red
    puts""
    puts'     \ ______/ V`-,'.red
    puts'      }        /~~'.red
    puts'     /_)^ --,r'.red
    puts'    |_|      |_| '.red
    puts""
    display_board(@board)
    until over? == true
      turn
      if over? == false
      computer_turn
      end
    end


    if !won?(@board) == false && winner == "X".yellow
      puts "------------------------------"
      puts "        CONGRATULATIONS       ".yellow
      puts "         YOU BEAT RUBY        ".yellow
      puts "------------------------------"
    elsif !won?(@board) == false && winner == "O".red
        puts "-----------------------------"
        puts "         RUBY BEAT YOU       ".red
        puts "     BETTER LUCK NEXT TIME   ".red
        puts""
        puts'        \ ______/ V`-,     '.red
        puts'         }        /~~'.red
        puts'        /_)^ --,r'.red
        puts'       |_|      |_| '.red
        puts""
        puts "-----------------------------"
    elsif draw?
      puts "-----------------------------"
      puts "   IT'S A DRAW, NOBODY WON   ".blue
      puts "-----------------------------"
    end
  else
    puts "INVALID RESPONSE".blue
    play
  end

  play_again?

end
end
