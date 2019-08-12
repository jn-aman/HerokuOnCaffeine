Rails.application.routes.draw do
get 'websites/new', to: 'websites#new', as: :new_website
get 'websites/create' 
get 'websites/delete' 
get 'zohoverify/verifyforzoho' , to: 'websites#verifyforzoho'
root :to => "websites#new"



end
