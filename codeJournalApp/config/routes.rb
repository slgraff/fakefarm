CodeJournalApp::Application.routes.draw do

resources :questions

root to: 'questions#index'

end
