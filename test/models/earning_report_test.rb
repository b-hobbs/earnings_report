require 'test_helper'
require 'earning_report.rb'

class EarningReportTest < ActiveSupport::TestCase
    def setup
        @report = EarningReport.new
    end
    
    # select function

    test "should add one select clause as array" do
        @report.select('column')
        assert_equal ['column'] , @report.instance_variable_get(:@select) 
    end

    test "should create array of select clauses" do 
        @report.select('column', 'column1', 'column2')
        assert_equal ['column', 'column1', 'column2'], @report.instance_variable_get(:@select)
    end

    test "should be able to chain select" do
        @report.select('column').select('column2')
        assert_equal ['column', 'column2'], @report.instance_variable_get(:@select)
    end

    # where function 

    test "should set one where condition" do
        @report.where('condition')
        assert_equal 'condition', @report.instance_variable_get(:@where) 
    end

    test "should overwrite where condition when chaining" do
        @report.where('condition1').where('condition2')
        assert_equal 'condition2', @report.instance_variable_get(:@where)
    end

    # build_query_string function

    test "should build the query string" do
        @report.select('column1', 'column2').where('condition1')
        assert_equal "$select=column1,column2&$where=condition1&", @report.build_query_string
    end

    # get function

    test "should get result from api" do
        @report.select("avg(total_earnings)").where("title = 'Nurse Case Manager'")
        assert @report.get.has_key?("avg_total_earnings")
    end
end
