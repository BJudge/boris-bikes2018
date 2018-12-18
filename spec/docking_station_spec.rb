require 'dockingstation'
describe DockingStation do
  #it 'should be able to release a bike' do
  #  expect(subject).to respond_to #:release_bike
  #end

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when docking station is full' do
      #bike = Bike.new
      #bike2 = Bike.new
      #subject.dock(bike)
      #expect { subject.dock(bike2) }.to raise_error 'Docking Station Full'
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking Station Full'
    end
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end

end
