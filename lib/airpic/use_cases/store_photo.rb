module Airpic
  class StorePhoto < UseCase
    def run params
      file = params[:file]
      sender_id = params[:sender_id]

      storage_conn = AWS::S3::Base.establish_connection!(
        access_key_id: ENV['S3_ACCESS_KEY'],
        secret_access_key: ENV['S3_SECRET_KEY']
      )
  
      if !storage_conn
        return failure error: :no_storage_connection
      end

      stored = AWS::S3::S3Object.store(
        file,
        File.open(file),
        "airpic/#{sender_id}/",
        access: :public_read
      )
  
      if !stored.success
        return failure error: stored.error
      end

      storage_url = AWS::S3::S3Object.url_for(
        file,
        "airpic/#{sender_id}/",
        authenticated: false
      )

      if !storage_url
        return failure error: :no_storage_url
      end

      success storage_url: storage_url
    end
  end
end
