require 'van'
describe Van do
  describe "#collect_broken_bikes" do
    it 'should collect broken bikes from DockingStation' do
      van = Van.new
      bike = Bike.new.report_broken
      DockingStation.new.dock(bike)
      van.collect_broken_bikes
      #expect(van.collect_broken_bikes).to be_broken
    end

  end
end
