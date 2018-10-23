require 'bookmark'
require 'pg'

describe 'Bookmark' do
  connection = PG.connect(dbname: 'bookmark_manager_test')
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      subject.create('The Guardian', 'https://www.theguardian.co.uk')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('The Guardian', 'https://www.theguardian.co.uk')
    end
  end
end
