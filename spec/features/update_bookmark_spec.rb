feature 'updating bookmark' do
  scenario 'a user can change a bookmark' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    click_button 'Update'
    fill_in 'title', with: 'The Guardian'
    fill_in 'url', with: 'http://www.theguardian.co.uk'
    click_button 'Save'
    expect(page).to have_link('The Guardian', href: 'http://www.theguardian.co.uk')
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
