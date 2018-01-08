require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    #raise @posts.inspect
    erb :index
  end

  get '/posts/:id' do
    #"This route works"

    @post = Post.find(params[:id])
    #raise @posts.inspect
    erb :show
  end

  get '/posts/:id/edit' do
    #"this route works"
    @post = Post.find(params[:id])
    #raise @post.inspect
    erb :edit
  end

  patch '/posts/:id' do
    #{}"route works"
    #puts params
    @post = Post.find(params[:id])
    @post.update(name: params[:post_name], content: params[:post_content])
    @post = Post.find(params[:id])
    #raise @post.inspect
    redirect "/posts/#{@post.id}"
  end

  post '/posts' do
    "/post routre works"
    #puts params
    @posts = []
    @posts << Post.create(name: params[:post_name], content: params[:post_content])
    #raise @posts.inspect
    erb :index
  end

  delete '/posts/:id/delete' do
  #  "route works"
    @post = Post.find(params[:id])
    #raise @post.inspect
    @post.destroy
    erb :delete
  end


end
