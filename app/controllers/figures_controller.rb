class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end 

  post '/figures' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.create(params["figure"])
    #binding.pry
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params["title"])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    ###
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    # @owner = Owner.find(params[:id])
    # @owner.update(params["owner"])
    # if !params["pet"]["name"].empty?
    #   @owner.pets << Pet.create(name: params["pet"]["name"])
    # end
    redirect "figures/#{@figure.id}"
  end

  delete '/figures/:id' do
    @figure.destroy
    redirect "/"
  end

end

