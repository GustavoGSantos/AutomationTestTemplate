# frozen_string_literal: true

# Class responsable to mapping the fields and for the methods to login page
class LoginPage < SitePrism::Page
  element :fld_email, '#user-name'
  element :fld_password, '#password'
  element :btn_sign_in, '#login-button'
  element :lbl_error_message, 'h3'
  element :lbl_success_message, 'span.title'

  def login_url
    visit 'https://www.saucedemo.com'
  end

  def login_user(email, password)
    fld_email.set email
    fld_password.set password
    btn_sign_in.click
  end

  def message_login
    if page.has_css?('h3') == true
      lbl_error_message.text
    else
      lbl_success_message.text
    end
  end
end
