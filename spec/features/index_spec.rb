# frozen_string_literal: true

describe "View homepage", type: :feature, js: true do
  it "Displays the status" do
    message = Faker::Alphanumeric.alphanumeric(number: 10)
    visit "/status.json?message=#{message}"
    expect(page).to have_text(message)
  end
end
