Rails.application.routes.draw do
  get 'position/:title/salary', to: 'earning_report#average_earnings', :defaults => { :format => :json }
end
