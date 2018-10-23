feature 'viewing a bookmark' do
  scenario 'a user views their saved bookmarks' do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.create('Google', 'http://www.google.com')
    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
