
# Case du plateau
class Cell
  attr_accessor :position, :content

  def initialize(num)
    @position = num
    @content = nil
  end

  def modify_content(symbol)
    @content = symbol
  end

  def empty?
    @content.nil?
  end

  def get_content
    @content
  end
end
