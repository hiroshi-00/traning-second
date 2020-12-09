require "application_system_test_case"

class PaidUsersTest < ApplicationSystemTestCase
  setup do
    @paid_user = paid_users(:one)
  end

  test "visiting the index" do
    visit paid_users_url
    assert_selector "h1", text: "Paid Users"
  end

  test "creating a Paid user" do
    visit paid_users_url
    click_on "New Paid User"

    fill_in "Create", with: @paid_user.create
    fill_in "Destroy", with: @paid_user.destroy
    fill_in "Edit", with: @paid_user.edit
    fill_in "Index", with: @paid_user.index
    fill_in "New", with: @paid_user.new
    fill_in "Show", with: @paid_user.show
    fill_in "Update", with: @paid_user.update
    click_on "Create Paid user"

    assert_text "Paid user was successfully created"
    click_on "Back"
  end

  test "updating a Paid user" do
    visit paid_users_url
    click_on "Edit", match: :first

    fill_in "Create", with: @paid_user.create
    fill_in "Destroy", with: @paid_user.destroy
    fill_in "Edit", with: @paid_user.edit
    fill_in "Index", with: @paid_user.index
    fill_in "New", with: @paid_user.new
    fill_in "Show", with: @paid_user.show
    fill_in "Update", with: @paid_user.update
    click_on "Update Paid user"

    assert_text "Paid user was successfully updated"
    click_on "Back"
  end

  test "destroying a Paid user" do
    visit paid_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paid user was successfully destroyed"
  end
end
