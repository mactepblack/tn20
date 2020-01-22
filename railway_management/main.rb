require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'railway_management'

puts "Вас приветствует система управления железнодорожным движением."

RailwayManagement.options_available

loop do
  puts "Выберите пункт меню 1-9, 0 - выход:"

  case gets.chomp.to_i 
  
  when 0
    break
  when 1
    RailwayManagement.create_station
  when 2
    RailwayManagement.create_train
  when 3
    RailwayManagement.route_management
  when 4
    RailwayManagement.train_add_route
  when 5
    RailwayManagement.train_add_carriage
  when 6
    RailwayManagement.train_remove_carriage
  when 7
    RailwayManagement.move_train
  when 8
    RailwayManagement.stations_info
  when 9
    RailwayManagement.options_available
  end
end
