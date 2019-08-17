Rails.application.routes.draw do
get 'websites/new', to: 'websites#new', as: :new_website
get 'websites/create' 
get 'websites/delete' 
get 'websites/getgraph/:email', to: 'websites#getgraph', constraints: { email: /[^\/]+/} , :as => :websites_status

get 'websites/getgraph2/:email', to: 'websites#getgraph2', constraints: { email: /[^\/]+/} , :as => :websites_status2

get 'speedtest' , to: 'websites#speedtest'
post 'websites/insertdata' 
namespace :websites do
get "completetask"
end

root :to => "websites#new"



end
