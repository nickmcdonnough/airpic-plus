require 'spec_helper.rb'

describe Airpic::UseCases::ProcessPhoto do
  it 'will return an error option if no photo is attached' do
    params = {:theres_no_image => :here}
    result = Airpic::UseCases::ProcessPhoto.run(params)
    expect(result.success?).to be false
  end

  it 'will correctly resize the photo and return it\'s location' do
    image_location = 'spec/fixtures/atlas_maple.png'
    params = {'images' => [{'image' => image_location}]}
    result = Airpic::UseCases::ProcessPhoto.run(params)
    expect(result.pdf_path).to_not be_nil
    expect(result.png_path).to_not be_nil
  end
end
