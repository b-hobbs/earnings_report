class EarningReportController < ApplicationController
    
    def average_earnings
        @average_earning = EarningReport.new.select("avg(total_earnings)").where("title = '#{params[:title]}'").get
        render json: @average_earning
    end
end
