feature 'index' do
  scenario 'when a user visits the site' do
    visit '/bookmarks'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'when a user clicks the add link' do
    visit '/bookmarks'
    find_button('Add link').click
  end
end
