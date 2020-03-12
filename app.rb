require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"   
#ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "mydb.db")
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/user'
require './models/team'

get '/' do    # display the list of user names and emails using user_display.erb 
  @users_array = User.all #use the Active Record method of selecting all users, that being @users=User.all  
  erb:users_display
end

get '/t' do   # display the list of user names and emails using user_display.erb 
  @teams_array = Team.all #use the Active Record method of selecting all users, that being @users=User.all  
  erb:teams_display
end

post '/display_user' do   #
  @teams_array = Team.all
  "<BR> <a href='teams_look'> Teams Look-up </a>"
  "Your user is #{params[:name]}"
  users = User.find_by(name: params[:name]) 
  if !users.nil? 
    user_team=Team.find_by(id=users.team_id.to_s)
    "User name: #{users.name}  email: #{users.email} team id: #{users.team_id} team name: #{user_team.name}"
  else
    "user #{params[:name]} does not exist"
  end
end

get '/teams_look' do
    erb:teams_display
end

post '/display_team' do  # should display team and all its users
  @team=Team.find_by(name:"#{params[:namet]}")  #Team.find_by(name: "Tigers")
  if !@team.nil?
    erb:teams_users
   end
end
