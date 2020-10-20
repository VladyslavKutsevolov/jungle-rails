require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

    first('article.product').click_link 'Details'

    find('section.products-show').visible?

    expect(page).to have_content('Apparel')
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')

    find('img').visible?
    
    save_screenshot
  end


end
