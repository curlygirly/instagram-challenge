require 'rails_helper'

feature 'commenting' do
  before {Photo.create name: 'Avotoast'}
  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
    click_link 'Comment'
    fill_in "Comments", with: "Looks delicious and healthy!"
    click_button 'Add comment'

    expect(current_path).to eq '/photos'
    expect(page).to have_content('Looks delicious and healthy')
  end
end