require "open-uri"
require "nokogiri"

class FilmCollection
  URL = "https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb"

  def initialize(films)
    @films = films
  end

  def directors
    @films.map(&:director).uniq
  end

  def choose_film(director)
    @films.select { |film| film.director == director }.sample
  end

  def self.from_wiki
    doc = Nokogiri::HTML.parse(URI.open(URL))
    films = doc.css("tbody>tr").filter_map do |node|
      lines = node.css(">td>a").map(&:text)
      next if lines.empty?
      Film.new(
        title: lines[0],
        year: lines[1],
        director: lines[2]
      )
    end
    new(films)
  end
end
