require 'spec_helper.rb'

describe Airpic::UseCases::ProcessPhoto do
  it 'will correctly resize the photo and return it\'s location' do
    image_location = 'spec/fixtures/atlas_maple.png'
    params = {'images' => [{'image' => image_location}]}
    result = Airpic::UseCases::ProcessPhoto.run(params)
    expect(result.pdf_path).to_not be_nil
    expect(result.png_path).to_not be_nil
  end
end
