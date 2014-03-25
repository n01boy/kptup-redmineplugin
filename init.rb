require 'redmine'

Redmine::Plugin.register :kptup do

  #permission
  permission :kptup, :kpts => [:show,:create,:delete,:destroy,:issues]

  #menu
  menu :project_menu, :kptup, { :controller => 'kpts', :action => 'show'}, :param => :project_id

  name 'kptup plugin'
  author 'torepan< n01@ie.boy.jp >'
  description 'KPTUP'
  version '0.0.1'
  url 'https://github.com/n01boy/application'
  author_url 'https://github.com/n01boy/application'
end
