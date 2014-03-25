RedmineApp::Application.routes.draw do
  match 'kpts/destroy/', :to => 'kpts#destroy'
  match 'kpts/create', :to => 'kpts#create'
  match 'kpts/show', :to => 'kpts#show'
  match 'kpts/issues', :to => 'kpts#issues'
end
