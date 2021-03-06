require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(name: 'Avotoast')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('Avotoast')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Name', with: 'Avotoast'
      click_button 'Create Photo'
      expect(page).to have_content 'Avotoast'
      expect(current_path).to eq '/photos'
    end
  end
end
