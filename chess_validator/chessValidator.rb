require 'pry'
ASCII_CONVERSOR = 97

class ReaderByItem
  def self.read_file(file_name)
    container = []
    file = File.open(file_name, "r")
    container = file.readlines
    file.close
    i = 0
    container.each do |row|
      container[i] = row.split
      i += 1
      container
    end
    container
  end
end

class IncluderByItem
  def self.includer?(ary_dim_2, pattern)
    val = []
    i = 0
    ary_dim_2.each do |row|
      if row.include?(pattern)
        val[i] = true
      end
      i += 1
      row
    end
    if val.include?(true)
      true
    else
      false
    end
  end
end


class Board
  attr_reader :board
  def initialize
    $board = ReaderByItem.read_file("simple_board.txt")
  end
end

class Piece
  def initialize(square)
    @figure = get_figure(square)
    binding.pry
  end

  def get_figure (square)
    figure = square.square_content.split('')[1]
    figure
  end
end

class Movement
  attr_reader :init_square, :final_square
  def initialize(movement)
    @init_square = Square.new(movement[0])
    @final_square = Square.new(movement[1])
  end

end

class Square
  attr_reader :square_xy, :square_content
  def initialize(square)
    @square_xy = square_coord(square)
    @square_content = square_get_content(@square_xy)
  end

  def square_coord(square)
    square_xy = []
    square_xy[0] = square.split('')[0].ord - ASCII_CONVERSOR
    square_xy[1] = square.split('')[1].to_i
    square_xy
  end

  def square_get_content(square_xy)
      content = $board[square_xy[0]][square_xy[1]]
      content
  end
end

class Validator
  include Rook
  def self.valide(move)
    movement = Movement.new(move)
    piece = Piece.new(movement.init_square)
    piece_mov = 
    if movement.final_square
  end
end

module Rook
  def self.rook_mov(square)
    valid_rook_coord = []
    i = 0
    while IncluderByItem.includer?($board, square_content)
      new_coord = [square_xy[0] + i, square_xy[1]]
      valid_rook_coord.push(new_coord)
      i += 1
    end
    while IncluderByItem.includer?($board, square_content)
      new_coord = [square_xy[0] - i, square_xy[1]]
      valid_rook_coord.push(new_coord)
      i += 1
    end
    while IncluderByItem.includer?($board, square_content)
      new_coord = [square_xy[0], square_xy[1] + i]
      valid_rook_coord.push(new_coord)
      i += 1
    end
    while IncluderByItem.includer?($board, square_content)
      new_coord = [square_xy[0], square_xy[1] - i]
      valid_rook_coord.push(new_coord)
      i += 1
    end
  end
end


board = Board.new
# moves = ReaderByItem.read_file("simple_moves.txt")
# moves.each do |mov|
#   Validator.valide(mov)
# end

puts IncluderByItem.includer?($board, "kaka")



# puts Movement.new("a2 a3").init_square.square_xy
# board = Board.new
# puts board.board[7][7]
