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
    result = @@connection.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(title, url)
    test_setup
    @@connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
  end

  def self.delete(id)
    test_setup
    @@connection.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end


def self.test_setup
  @@connection = if ENV['ENVIRONMENT'] == 'test'
                 PG.connect(dbname: 'bookmark_manager_test')
               else
                 PG.connect(dbname: 'bookmark_manager')
               end
end

end
