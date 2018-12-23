class Bike
  attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    @working
  end

  def report_broken
    @broken = true
  end

  def fixed
    @broken = false
  end

  def broken?
    @broken
  end

end
