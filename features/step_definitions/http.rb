When(/^making GET request$/) do
  @last_response = RestClient.get 'https://sigapp.signicat.net:4443'
end

Then(/^the response should be:$/) do |resp|
   expect(@last_response.body).to eq(resp)
end