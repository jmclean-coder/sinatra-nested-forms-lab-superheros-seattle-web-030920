require 'sinatra/base'
require 'pry'

class App < Sinatra::Base
    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        params[:team][:members].each do |hero_args|
            Hero.new(hero_args)
        end
        # binding.pry
        @team = Team.new(params[:team])
        @heroes = Hero.all
        erb :team
    end


end
