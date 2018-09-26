class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  attr_reader :name, :trains

  def take_train(train)
    @trains << train
  end

  def show_trains
    @trains.each { |train| puts train }
  end

  def by_type
    cargo = @trains.select { |train| train.is_a? CargoTrain }
    passenger = @trains.select { |train| train.is_a? CargoTrain }
    puts "Грузовых - #{cargo.size} Пассажирских - #{passenger.size}"
  end

  def send_train(train)
    @trains.delete(train)
  end
end
