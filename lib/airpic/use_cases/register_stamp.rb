module Airpic
module UseCases

  class RegisterStamp < UseCase
    def run params
      stamp = Airpic::DBI.exec.create_stamp(params)

      if stamp.nil?
        return failure(:error)
      end

      success amount: stamp.value
    end
  end

end
end
