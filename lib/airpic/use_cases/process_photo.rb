module Airpic
  class ProcessPhoto < UseCase
    def run params
      if !params['images'] 
        return failure error: :no_photo
      end

      photo_url = params['images'][0]['image']
      photo = Magick::Image.read(photo_url).first
      paths = resize_photo(photo, params[:sender_id])

      success pdf_path: paths[:pdf], png_path: paths[:png]
    end

    def resize_photo photo, sender_id
      photo_name = "#{sender_id}_#{Time.now.to_i}"
      pdf_path = "tmp_pics/#{photo_name}.pdf"
      png_path = "tmp_pics/#{photo_name}.png"

      if photo.rows > photo.columns # check for portrait orientation
        new_photo = photo.resize_to_fill(1200,1800)
      else # must be landscape orientation
        new_photo = photo.resize_to_fill(1800,1200)
      end

      new_photo.density = '300x300'
      new_photo.write(pdf_path)
      new_photo.write(png_path)

      OpenStruct.new(pdf: pdf_path, png: png_path)
    end
  end
end
