require 'pg'

class Bookmark

attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    test_setup
    bookmarks = @@connection.exec('SELECT * FROM bookmarks;')
    bookmarks.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

  def self.create(title:, url:)
    test_setup
    bookmark = @@connection.exec("INSERT INTO bookmarks (title, url)
      VALUES ('#{title}', '#{url}')
      RETURNING id, title, url;"
      )
      Bookmark.new(
        id: bookmark[0]['id'],
        title: bookmark[0]['title'],
        url: bookmark[0]['url']
      )
  end

  def self.delete(id:)
    test_setup
    @@connection.exec("DELETE FROM bookmarks WHERE id='#{id}';")
  end

  def self.update(id:, title:, url:)
    test_setup
    bookmark = @@connection.exec(
      "UPDATE bookmarks
      SET title='#{title}', url='#{url}'
      WHERE id= '#{id}'
      RETURNING id, url, title;")
      Bookmark.new(
        id: bookmark[0]['id'],
        title: bookmark[0]['title'],
        url: bookmark[0]['url']
      )
  end

def self.test_setup
  @@connection = if ENV['ENVIRONMENT'] == 'test'
                 PG.connect(dbname: 'bookmark_manager_test')
               else
                 PG.connect(dbname: 'bookmark_manager')
               end
end

end
