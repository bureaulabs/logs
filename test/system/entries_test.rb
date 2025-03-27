require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit entries_url
    assert_selector "h1", text: "Entries"
  end

  test "should create entry" do
    visit entries_url
    click_on "New entry"

    fill_in "Caption", with: @entry.caption
    fill_in "Category", with: @entry.category_id
    fill_in "Metadata raw", with: @entry.metadata_raw
    fill_in "Og url", with: @entry.og_url
    fill_in "Props", with: @entry.props
    fill_in "Site", with: @entry.site_id
    fill_in "Slug", with: @entry.slug
    fill_in "Title", with: @entry.title
    fill_in "Url", with: @entry.url
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "should update Entry" do
    visit entry_url(@entry)
    click_on "Edit this entry", match: :first

    fill_in "Caption", with: @entry.caption
    fill_in "Category", with: @entry.category_id
    fill_in "Metadata raw", with: @entry.metadata_raw
    fill_in "Og url", with: @entry.og_url
    fill_in "Props", with: @entry.props
    fill_in "Site", with: @entry.site_id
    fill_in "Slug", with: @entry.slug
    fill_in "Title", with: @entry.title
    fill_in "Url", with: @entry.url
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Entry" do
    visit entry_url(@entry)
    click_on "Destroy this entry", match: :first

    assert_text "Entry was successfully destroyed"
  end
end
