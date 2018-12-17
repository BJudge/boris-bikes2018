require 'dockingstation'
describe DockingStation do
  #it 'should be able to release a bike' do
  #  expect(subject).to respond_to #:release_bike
  #end

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end


  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
