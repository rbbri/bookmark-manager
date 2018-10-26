feature 'deleting a bookmark' do

  scenario 'a user deletes a bookmark' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    click_button 'Delete'
    # expect(current_path).to eq "/bookmarks/"
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end

end
