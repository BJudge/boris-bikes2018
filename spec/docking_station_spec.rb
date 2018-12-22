require 'dockingstation'
describe DockingStation do
  #it 'should be able to release a bike' do
  #  expect(subject).to respond_to #:release_bike
  #end

  describe '#release_bike' do
    let(:bike) { double :bike }
    it 'releases working bikes' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
      #subject.dock Bike.new
      #bike = subject.release_bike
      #expect(bike).to be_working
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it 'raises an error when there are no working bikes' do
      bike = double (:bike)
      allow(bike).to receive(:broken?).and_return(true)
        # or bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike}.to raise_error 'No working bikes available'
    end
  end

  describe '#initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike) }
      expect { docking_station.dock double(:bike) }.to raise_error 'Docking Station Full'
    end
    subject { DockingStation.new }
    let(:bike) { double (:bike) }
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
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking Station Full'
    end
    it 'docks something' do
      double(:bike)
      expect(subject.dock(:bike)).to eq [:bike]
    end
    it 'returns docked bikes' do
      double(:bike)
      subject.dock(:bike)
      expect(subject.bikes).to eq [:bike]
    end
  end

end
