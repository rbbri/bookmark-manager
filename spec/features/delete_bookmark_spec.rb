feature 'deleting a bookmark' do
  scenario 'a user clicks delete link and views their saved bookmarks' do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.create('Google', 'http://www.google.com')
    visit '/'
    click_button('Delete link')
    expect(page).to have_button 'Makers Academy'
    expect(page).to have_button 'Destroy All Software'
    expect(page).to have_button 'Google'
  end
    # Bookmark.create("The Guardian", "https://www.theguardian.co.uk")
  scenario 'a user deletes a link' do
    Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
    Bookmark.create('Google', 'http://www.google.com')
    visit '/'
    click_button('Delete link')
    click_button('Makers Academy')
    expect(page).not_to have_button 'Makers Academy'
  end 

end
