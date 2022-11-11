require_relative "lib/film"
require_relative "lib/film_collection"

films = FilmCollection.from_wiki

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
