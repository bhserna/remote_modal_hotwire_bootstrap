require "system_helper"

RSpec.describe "User deletes product" do
  let!(:product) { create :product }

  scenario "successfully", js: true do
    visit products_path

    within "#product_#{product.id}" do
      click_on "Delete"
    end

    expect(page).not_to have_css "#product_#{product.id}"
  end
end
