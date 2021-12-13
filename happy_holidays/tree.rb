class Tree < Struct.new(:height)
  def initialize(height)
    super(height.zero? ? 25 : height)
  end

  def to_s
    (1..height).map(&self.method(:line_to_s)).join("\n")
  end

  private

  def line_length(line_number)
    line_number * 2 - 1
  end

  def line_to_s(line_number)
    length = line_length(line_number)
    length.times.map { "*" }.join.rjust(line_length(height) - (height - line_number))
  end
end

class TreeFileIO < Struct.new(:in_filename, :out_filename)
  def write_christmas_tree
    height = File.read(in_filename).to_i
    File.open(out_filename, 'w') do |f|
      f.puts "\e[0;92m#{Tree.new(height).to_s}"
    end
  end
end

TreeFileIO.new("./merry-christmas.txt" , "./happy-holidays.txt")
  .write_christmas_tree
