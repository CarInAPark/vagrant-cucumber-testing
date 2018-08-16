Given("I am on {string}") do |string|	
  @browser ||= Watir::Browser.new :firefox
  @browser.goto string
end

# link
Given(/^I click the "(.*?)" button$/) do |ele|
  case
  when @browser.button(id: ele).exists?
       @browser.button(id: ele).click    
  when @browser.button(text: ele).exists?
       @browser.button(text: ele).click	

  else
    fail("Button => #{ele} NOT FOUND")
  end
end

#change as needed
Then(/^the page loads$/) do
  @browser.div(id: "div").wait_until_present
  puts "Page loaded"
    @browser.close
end