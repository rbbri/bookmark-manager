require 'bookmark'
require 'pg'

describe 'Bookmark' do
  describe '.all' do
    it 'returns a list of bookmarks' do
      Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
      Bookmark.create('Google', 'http://www.google.com')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create('The Guardian', 'https://www.theguardian.co.uk')
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq('The Guardian')
    end
  end
  describe '.delete' do
    it 'deletes a  bookmark' do
      bookmark = Bookmark.create('The Guardian', 'https://www.theguardian.co.uk')
      bookmarks = Bookmark.all
      Bookmark.delete(bookmarks[0].id)

      expect(bookmarks).not_to include('The Guardian')
    end
  end
end
