require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Address", with: @item.address
    fill_in "Company url", with: @item.company_url
    fill_in "Description", with: @item.description
    fill_in "Founding year", with: @item.founding_year
    fill_in "Image link", with: @item.image_link
    fill_in "Name", with: @item.name
    fill_in "Website", with: @item.website
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Address", with: @item.address
    fill_in "Company url", with: @item.company_url
    fill_in "Description", with: @item.description
    fill_in "Founding year", with: @item.founding_year
    fill_in "Image link", with: @item.image_link
    fill_in "Name", with: @item.name
    fill_in "Website", with: @item.website
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
