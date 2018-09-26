class Train
  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    @type = :unknown
  end

  attr_reader :speed, :number, :type, :wagons, :current_station

  def speed_up
    @speed += 20
  end

  def stop
    @speed = 0
  end

  def wagons
    @wagons.size
  end

  def add_wagon(wagon)
    @wagons << wagon if @speed.zero?
  end

  def delete_wagon
    @wagons.pop if speed.zero?
  end

  def route=(route)
    @route = route
    @station_index = 0
    current_station.take_train(self)
  end

  def go_forward
    return puts "Это последняя станция" unless next_station
    current_station.send_train(self)
    @station_index += 1
    current_station.take_train(self)
  end

  def go_backward
    return puts "Это первая станция" unless previous_station
    current_station.send_train(self)
    @station_index -= 1
    current_station.take_train(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  private

  def next_station
    return puts "Это последняя станция" if current_station == @route.stations.last
    @route.stations[@station_index + 1]
  end

  def previous_station
    return puts "Это первая станция" if current_station == @route.stations.first
    @route.stations[@station_index - 1]
  end
end
