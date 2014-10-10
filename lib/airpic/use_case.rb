require 'ostruct'

module Airpic
  class UseCase
    def self.run inputs
      self.new.run inputs
    end

    def success data={}
      data.merge!(success?: true)
      OpenStruct.new(data)
    end

    def failure error, data={}
      data.merge!(error: error, success?: false)
      OpenStruct.new(data)
    end
  end
end
