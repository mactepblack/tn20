require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

puts "Система управлением железной дорогой. Выберите необходимое действие:"

menu = {
  #   - Создавать станции
  #   - Создавать поезда
  #   - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  #   - Назначать маршрут поезду
  #   - Добавлять вагоны к поезду
  #   - Отцеплять вагоны от поезда
  #   - Перемещать поезд по маршруту вперед и назад
  #   - Просматривать список станций и список поездов на станции
  # отобразить меню
  # выйти 
}

loop do
  action = gets.chomp.to_i

  break if action.zero? 
end
