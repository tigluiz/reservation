require 'spec_helper'
feature 'User see link text change on reservation' do

  scenario "User see several hours" do
    sign_in
    visit reservations_path
    expect(page).to have_content('6:00')
    expect(page).to have_content('12:00')
    expect(page).to have_content('23:00')
  end
  scenario "User see several wdays" do
    sign_in
    visit reservations_path
    expect(page).to have_content('Segunda')
    expect(page).to have_content('Quarta')
    expect(page).to have_content('Sexta')
  end
  scenario "User see link to make reservation" do
    sign_in
    visit reservations_path
    expect(page).to have_content('Disponível')
  end
  scenario "User see link to make reservation" do
    sign_in
    visit reservations_path
    expect(page).to have_content('Disponível')
  end
  scenario "User click on avaliable link and see new text" do
    @javascript
    sign_in
    visit reservations_path
    first(:link, 'Disponível').click
    expect(page).to have_content('Cancelar')
    expect(page).to have_content("Reservado por Almeida")
  end
end
