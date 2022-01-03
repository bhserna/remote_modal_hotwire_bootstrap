require "system_helper"

RSpec.describe "User edits product" do
  let!(:product) { create :product }

  scenario "successfully", js: true do
    visit products_path

    within "#product_#{product.id}" do
      click_on "Edit"
    end

    fill_in "Name", with: "Updated product"
    fill_in "Description", with: "Updated description"
    click_on "Update"

    within "#product_#{product.id}" do
      expect(page).to have_text "Updated product"
      expect(page).to have_text "Updated description"
    end
  end

  scenario "with errors", js: true do
    visit products_path

    within "#product_#{product.id}" do
      click_on "Edit"
    end

    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_on "Update"

    expect(page).to have_text "Name can't be blank", normalize_ws: true
    expect(page).to have_text "Description can't be blank", normalize_ws: true
  end
end
