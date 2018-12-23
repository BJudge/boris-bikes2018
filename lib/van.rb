require_relative 'dockingstation'
require_relative 'garage'

class Van
  attr_reader :bikes_onboard

  def initialize
    @bikes_onboard = []
  end

  def collect_broken_bikes(station)
    @bikes_onboard << station.release_broken_bikes
  end

  def deliver_broken_bikes
    @bikes_onboard
  end

  def collect_working_bikes(garage)
    @repaired = garage.workflow
  end

end
