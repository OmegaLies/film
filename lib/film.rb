class Film
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def full_info
    "#{@director} - #{@title} - (#{@year})"
  end
end
