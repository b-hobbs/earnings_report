require 'test_helper'
require 'earning_report.rb'

class EarningReportControllerTest < ActionController::TestCase

    # function average_earnings

    test "should get average earnings" do
        get :average_earnings, {title: 'Nurse Case Manager'}
        assert_response :success
        assert_not_nil assigns(:average_earning)
    end
end
