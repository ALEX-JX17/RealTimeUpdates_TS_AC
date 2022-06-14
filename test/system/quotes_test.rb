require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) #This is a reference to the firts fixture quote 
  end

  test "Creating a new quote" do
    # Whne we visited the quotes#index page 
    # we expect to see a title text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    #When we click in the link with the text "New quote"
    # we expect to land on a page with the title  "New quote"
    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    # When we fill the name input with "Some quote"
    # and we click on "Create quote"
    fill_in "Name", with: "Some quote"
    click_on "Create Quote"

    # we expect to be back in the page with title "Quotes"
    # and to see our "Some " added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Some quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end
  
  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit"

    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end

end
