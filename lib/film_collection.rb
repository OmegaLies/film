class FilmCollection
  def initialize(args)
    @films = args[:films]
  end

  def directors
    @films.map(&:director).uniq
  end

  def choose_film(director)
    @films.select { |film| film.director == director }.sample
  end

  def self.from_url(url)
    doc = Nokogiri::HTML.parse(URI.open(url))
    films = doc.css("tbody>tr").map do |node|
      lines = node.css(">td>a").map(&:text)
      if lines.empty?
        nil
      else
        Film.new(
          title: lines[0],
          year: lines[1],
          director: lines[2]
        )
      end
    end
    new(films: films.compact)
  end
end
