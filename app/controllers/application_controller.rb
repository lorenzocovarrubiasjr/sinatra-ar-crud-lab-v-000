
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do 
    erb :index 
  end 
  
   get '/show/posts/:id' do
   @post = Post.find_by_id(params[:id])
    erb :show 
  end 
  
  get '/posts/new' do 
    erb :new 
  end 
  
  get '/posts/:id' do 
    @post = Post.find_by_id(params[:id])
    binding.pry
    erb :show
  end 
  
  get '/posts' do 
  @posts = Post.all 
  
   erb :index 
  end 
  
  post '/posts' do 
    @post = Post.create(name: params[:post_name], content: params[:post_content])
    @posts = Post.all 
  
    erb :index 
  end 

 

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end


end
#>>>>>>> 9c6464d9607186bb92210f4fcc4f928725d5ad16
