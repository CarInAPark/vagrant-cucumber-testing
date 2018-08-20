When(/^making GET request$/) do
  @last_response = RestClient.get 'URL:4443'
end

Then(/^the response should be:$/) do |resp|
   expect(@last_response.body).to eq(resp)
end