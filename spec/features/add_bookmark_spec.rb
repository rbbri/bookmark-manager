feature 'adding a bookmark' do
  scenario "when a user saves a webpage" do
    visit "/"
    click_button("Add link")
    expect(page).to have_content "Enter title of bookmark"
    expect(page).to have_content "Enter url"
    expect(page).to have_field "title"
    expect(page). to have_field "url"
  end
end
