class Film
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year.to_i
  end

  def to_s
    "Режиссер #{@director} - #{@title} (#{@year})"
  end
end
