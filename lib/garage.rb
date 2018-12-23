require_relative 'van'
require_relative 'bike'

class Garage
attr_reader :workflow

  def recieve_broken_bikes(van)
    @workflow =  van.deliver_broken_bikes

  end

  def fix_bikes

  end

end
