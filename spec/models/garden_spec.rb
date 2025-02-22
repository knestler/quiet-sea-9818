require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'model methods' do
    before :each do
    @garden1 = Garden.create!(name: "Moms", organic: true)
    @garden2 = Garden.create!(name: "Nannies", organic: false)

    @plot1 = Plot.create!(number: 1, size: "1 Acre", direction: "North", garden_id: @garden1.id)
    @plot2 = Plot.create!(number: 2, size: "2 Acres", direction: "East", garden_id: @garden1.id)
    @plot3 = Plot.create!(number: 3, size: "3 Acres", direction: "South", garden_id: @garden1.id)
    @plot4 = Plot.create!(number: 4, size: "4 Acres", direction: "West", garden_id: @garden2.id)

    @plant1 = Plant.create!(name: "apple", description: "gala", days_to_harvest: 50)
    @plant2 = Plant.create!(name: "pumpkin", description: "white", days_to_harvest: 25)
    @plant3 = Plant.create!(name: "rasberry", description: "sweet", days_to_harvest: 75)
    @plant4 = Plant.create!(name: "squash", description: "butternut", days_to_harvest: 125)

    @plot_plant1 = PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    @plot_plant2 = PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant2.id)
    @plot_plant3 = PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant3.id)
    @plot_plant4 = PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant4.id)
    end
    # require 'pry'; binding.pry
    it 'has plants with < 100 days to harvest' do
       expect(@garden1.harvest_less_than_100).to eq([ "apple", "pumpkin", "rasberry"])
    end
  end
end
