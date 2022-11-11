class Film
  attr_reader :title, :director, :year

  def initialize(args)
    @title = args[:title]
    @director = args[:director]
    @year = args[:year]
  end

  def to_s
    "#{@director} - #{@title} - (#{@year})"
  end
end
