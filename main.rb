require_relative "lib/film"

puts "Программа «Фильм на вечер:"

#Нашли файлы для чтения
folder = Dir[File.join(__dir__, 'data', '*.txt')]

#Читаем содержимое во всех файлах и помещаем в массив film_data
films = folder.map do |filmname|
  lines = File.readlines(filmname, chomp: true)
  Film.new(lines[0], lines[1], lines[2]) #Каждую строку массива определяем для класса Film
end

#Массив всех уникальных режисеров
list_directors = films.map(&:director).uniq

#Выводим список режиссеров и индексируем
list_directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
puts

#Выбор пользователя
user_input = STDIN.gets.to_i - 1

selected_director_film = films.select{ |film| list_directors[user_input] == film.director }.sample

if (1..list_directors.size).include?(user_input)
  puts "И сегодня вечером рекомендую посмотреть:"
  puts selected_director_film
else
  puts "Извините, фильма с таким номером у нас нет."
end
