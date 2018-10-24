feature 'deleting a bookmark' do
  scenario 'a user clicks delete link and views their saved bookmarks' do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.create('Google', 'http://www.google.com')
    visit '/'
    click_button('Delete link')
    save_and_open_page
    expect(page).to have_button 'Makers Academy'
    expect(page).to have_button 'Destroy All Software'
    expect(page).to have_button 'Google'
  end
    # Bookmark.create("The Guardian", "https://www.theguardian.co.uk")


end
