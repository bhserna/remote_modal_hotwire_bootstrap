require "system_helper"

RSpec.describe "User creates product" do
  scenario "successfully", js: true do
    visit products_path

    click_on "New product"

    fill_in "Name", with: "My product"
    fill_in "Description", with: "My product description"
    click_on "Create"

    within "#products" do
      expect(page).to have_text "My product"
      expect(page).to have_text "My product description"
    end
  end

  scenario "with errors", js: true do
    visit products_path

    click_on "New product"

    click_on "Create"

    expect(page).to have_text "Name can't be blank", normalize_ws: true
    expect(page).to have_text "Description can't be blank", normalize_ws: true
  end
end
