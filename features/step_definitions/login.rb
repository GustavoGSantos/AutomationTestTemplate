# frozen_string_literal: true

Given('I am in login page') do
  login.login_url
end

When('I login with e-mail {string} and password {string}') do |email, password|
  login.login_user(email, password)
end

Then('I expect to see {string}') do |message|
  login_message = login.message_login
  expect(message).to eq login_message
end
