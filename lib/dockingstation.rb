require_relative 'bike'
require_relative'van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :bikes, :broken_array

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_array = []
    @capacity = capacity

  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if all_bikes_broken?
    release_working_bikes

  end

  def release_broken_bikes
    bike = broken_bikes
    @broken_array << bike
    @bikes.delete(bike)
  end

  def dock(bike)
    fail 'Docking Station Full' if full?
    @bikes << bike
  end

  def collect_from_van(van)
    @bikes << van.collect_working_bikes
  end

  private

  def working_bikes
    @bikes.each { |bike| return bike unless bike.broken? }
  end

  def broken_bikes
    @bikes.each { |bike| return bike if bike.broken? }
  end

  def all_bikes_broken?
    @bikes.all?(&:broken?)
  end

  def release_working_bikes
    bike = working_bikes
    @bikes.delete(bike)
  end

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
