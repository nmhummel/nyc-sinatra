class LandmarksController < ApplicationController
  # add controller methods

  #see all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  #create new landmark
  get '/landmarks/new' do
    # @titles = Title.all
    # @figures = Figure.all
    erb :'landmarks/new'
  end 

  #show ONE landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  # edit ONE landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  #edits landmark
  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end


  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end
 

end