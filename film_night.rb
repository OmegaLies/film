require "open-uri"
require "nokogiri"
require_relative "lib/film"
require_relative "lib/film_collection"

URL = "https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb"
films = FilmCollection.from_url(URL)

puts <<~GREETENGS
Вас приветствует программа «Фильм на вечер»!
Фильм какого режисера вы хотите сегодня посмотреть?

Список режисеров:
GREETENGS

films.directors.each.with_index(1) { |director, index| puts "#{index}. #{director}" }
puts
puts "Введите номер режисера:"
user_input = STDIN.gets.to_i
puts
puts "Сегодня вечером рекомендую посмотреть:"
puts films.choose_film(films.directors[user_input - 1])
