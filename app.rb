require 'sinatra/base'
require_relative './lib/bookmark'
require './lib/database_connection_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  get '/bookmarks/:id/update' do
    @id = params[:id]
    erb :"bookmarks/update"
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
