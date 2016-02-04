# Basic wrapper for data.cityofboston.gov earnings report
# SEE: https://dev.socrata.com/docs/queries/
# This would probably be better as a standalone gem

# Builds a uri to query data.cityofboston in an active record query builder esque fashion

require 'net/http'
require 'json'

class EarningReport

    def initialize(endpoint = nil)
        @endpoint = endpoint || 'https://data.cityofboston.gov/resource/4swk-wcg8.json'
        @select = []
        @where = ""
    end

    def select(*columns)
        @select += columns
        self
    end

    def where(condition)
        @where = condition 
        self
    end

    def get
        url = URI.parse(URI.encode("#{@endpoint}?#{build_query_string}"))
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host) {|http|
            http.request(req)
        }
        JSON.parse(res.body)[0]
    end

    def build_query_string
        query = ""
        query += "$select=" + @select.join(',') + "&" if !@select.empty?
        query += "$where=" + @where + "&" if !@where.empty?
    end

end
