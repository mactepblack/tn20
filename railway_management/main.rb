require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

menu = [
  "1 - Создать станцию",
  "2 - Создать поезд",
  "3 - Создать маршрут и управлять станциями в нем (добавлять, удалять)",
  "4 - Назначить маршрут поезду",
  "5 - Добавить вагоны к поезду",
  "6 - Отцепить вагоны от поезда",
  "7 - Перемещать поезд по маршруту вперед и назад",
  "8 - Просматривать список станций и список поездов на станции",
  "9 - Отобразить список команд",
  "0 - Выйти" 
]

loop do
  action = gets.chomp.to_i

  break if action.zero?
end
