class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains_list = []
  end

  def accept_train(train)
    @trains_list << train

    puts "На станцию #{name} прибыл поезд №#{train.number}"
  end

  def puts_trains_list
    puts "На станции #{self.name} находятся следующие поезда:"

    @trains_list.each { |train| puts "Поезд №#{train.number}" }
  end

  def puts_trains_list_by_type(type)
    puts "На станции #{self.name} находятся следующие поезда типа #{type}:"

    @trains_list.each { |train| puts "Поезд №#{train.number}" if train.type == type }
  end

  def send_train(train)
    @trains_list.delete(train)

    puts "Со станции #{self.name} убыл поезд №#{train.number}"
  end
end
