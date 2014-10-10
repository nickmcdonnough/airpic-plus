module Airpic
  class PrintStamp < UseCase
    def run params
      if params[:credit]
        result = Airpic::DB.run.create_stamp(params[:amount], params[:user_id])
      elsif params[:deduct]
        result = Airpic::DB.run.deduct_stamp(params[:amount], params[:user_id])
      end
      
      if !result
        return failure error: :problem_saving_stamp
      end

      success
    end
  end
end
