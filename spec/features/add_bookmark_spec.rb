feature 'adding a bookmark' do
  connection = PG.connect(dbname: 'bookmark_manager_test')

  scenario 'a user clicks add link and is presented with a form' do
    visit '/'
    click_button('Add link')
    expect(page).to have_content 'Enter title of bookmark'
    expect(page).to have_content 'Enter url'
    expect(page).to have_field 'title'
    expect(page). to have_field 'url'
  end
  scenario 'a user adds a link and the link is saved' do
    visit '/'
    click_button('Add link')
    fill_in 'title', with: 'The Guardian'
    fill_in 'url', with: 'http://www.theguardian.co.uk'
    click_button 'Save'
    expect(page).to have_content 'The Guardian'
    expect(page).to have_content 'http://www.theguardian.co.uk'
  end
end
