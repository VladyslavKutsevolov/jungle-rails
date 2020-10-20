require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
  @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "They see properly rendered product detail page" do
    visit root_path

    first('article.product').click_button 'Add'
    expect(page).to have_content('My Cart (1)')

    visit '/cart'

    expect(page).to_not have_content('Your cart is empty, please add items here')

    expect(page).to have_css("img[src*='apparel1.jpg']")

    expect(page).to have_content('Unit Price')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
    expect(page).to have_content('TOTAL')

    save_screenshot
  end
end
