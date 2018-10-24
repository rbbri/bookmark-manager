require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    title = params[:title]
    url = params[:url]
    Bookmark.create(title, url)
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end


  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
