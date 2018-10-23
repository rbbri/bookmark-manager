require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/save' do
    title = params[:title]
    url = params[:url]
    Bookmark.create(title, url)
    redirect '/'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $PROGRAM_NAME
end
