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
    it 'raises an error when there are no working bikes' do
      station = DockingStation.new
      bike= Bike.new
      bike.report_broken
      station.dock(bike)
      expect { station.release_bike}.to raise_error 'No working bikes available'
    end
  end

  describe '#initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect { docking_station.dock Bike.new }.to raise_error 'Docking Station Full'
    end
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike)}.to raise_error 'Docking Station Full'
    end
  end

  describe '#dock' do
    it 'raises an error when docking station is full' do
      #bike = Bike.new
      #bike2 = Bike.new
      #subject.dock(bike)
      #expect { subject.dock(bike2) }.to raise_error 'Docking Station Full'
      subject.capacity.times { subject.dock Bike.new }
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
