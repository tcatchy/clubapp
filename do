cd clubsapp
bundle install
bundle update
rake db:drop
rake db:create
rake db:migrate
rake db:seed
rails s