require 'dockingstation'
describe DockingStation do
  #it 'should be able to release a bike' do
  #  expect(subject).to respond_to #:release_bike
  #end
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
