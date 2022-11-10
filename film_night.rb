require_relative "lib/film"

file_names = Dir["#{__dir__}/data/*.txt"]
films = file_names.map do |file_name|
  lines = File.readlines(file_name, chomp: true)
  Film.new(lines[0], lines[1], lines[2])
end

directors = films.map(&:director).uniq

puts "Программа «Фильм на вечер»"
puts
puts "Фильм какого режисера вы хотите сегодня посмотреть?"
puts
puts "Список режисеров:"

directors.each.with_index(1) { |director, index| puts "#{index}. #{director}" }
puts
puts "Введите номер из списка:"
user_input = STDIN.gets.to_i
puts

director_films = films.find_all { |film| film.director == directors[user_input - 1] }

puts "Сегодня вечером рекомендую посмотреть:"
puts director_films.sample.full_info
