require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @qoute = qoutes(:firts) #This is a reference to the firts fixture quote 
  end

  test "Creating a new quote" do
    # Whne we visited the quotes#index page 
    # we expect to see a title text "Quotes"
    visit qoutes_path
    assert_selector "h1", text: "Qoutes"

    #When we click in the link with the text "New quote"
    # we expect to land on a page with the title  "New quote"
    click_on "New quote"
    assert_selector "h1", text: "New quote"

    # When we fill the name input with "Some qoute"
    # and we click on "Create qoute"
    fill_in "Name", with: "Some qoute"
    click_on "Create qoute"

    # we expect to be back in the page with title "Qoutes"
    # and to see our "Some qoute" added to the list
    assert_selector "h1", text: "Qoutes"
    assert_text "Some qoute"
  end

  test "Showing a qoute" do
    visit qoutes_path
    click_link @qoute.name

    assert_selector "h1", text: @qoute.name
  end
  
  test "Updating a qoute" do
    visit qoutes_path
    assert_selector "h1", text: "Qoutes"

    click_on "Edit", match: :firts
    assert_selector "h1", text: "Edit quoute"

    fill_in "Name", with: "Updated quote"
    click_on "Update qoute"

    assert_selector "h1", text: "Qoutes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end

end
