require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) #This is a reference to the firts fixture quote 
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Creating a new quote" do
    # When we visited the quotes#index page 
    # we expect to see a title text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click in the link with the text "New quote"
    # we expect to have a form in the page fill it with "New quote"
    click_on "New Quote"
    fill_in "Name", with: "New quote"

    # After that we expect to be in the same page
    # When we click in the button with the text "Create quote"
    assert_selector "h1", text: "Quotes"
    click_on "Create quote"

    # We expect to be in the page with title "Quotes"
    # and to see our "New quote " added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "New quote"
  end
 
  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    assert_selector "h1", text: "Quotes"
    click_on "Update quote"

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
