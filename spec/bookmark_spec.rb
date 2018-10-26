require 'bookmark'
require 'pg'

describe 'Bookmark' do
  describe '.all' do
    it 'returns a list of bookmarks' do
      Bookmark.create(
        title: 'Makers Academy',
        url:'http://www.makersacademy.com'
      )
      Bookmark.create(
        title: 'Destroy All Software',
        url:'http://www.destroyallsoftware.com'
      )
      Bookmark.create(
        title: 'Google',
        url:'http://www.google.com'
      )
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(
        title: 'The Guardian',
        url:'https://www.theguardian.co.uk'
      )
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq('The Guardian')
    end
  end
  describe '.delete' do
    it 'deletes a  bookmark' do
      Bookmark.create(
        title: 'The Guardian',
        url:'https://www.theguardian.co.uk'
      )
      bookmarks = Bookmark.all
      Bookmark.delete(id: bookmarks[0].id)

      expect(bookmarks).not_to include('The Guardian')
    end
  end
  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(
        title: 'Makers Academy',
        url:'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(
        id: bookmark.id,
        title: 'The Guardian',
        url: 'https://www.theguardian.co.uk'
      )
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'The Guardian'
      expect(updated_bookmark.url).to eq 'https://www.theguardian.co.uk'
    end
  end

end
