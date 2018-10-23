require 'pg'

class Bookmark
  def self.all
    test_setup
    result = @@connection.exec('SELECT * FROM bookmarks;')
    d = result.map { |bookmark| [bookmark['title'].to_s, bookmark['url']] }
    d.join
  end

  def self.create(title, url)
    @@connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
  end



def self.test_setup
  @@connection = if ENV['ENVIRONMENT'] == 'test'
                 PG.connect(dbname: 'bookmark_manager_test')
               else
                 PG.connect(dbname: 'bookmark_manager')
               end
end

end
