# frozen_string_literal: true

# Class responsable to mapping the fields and for the methods to login page
class LoginPage < SitePrism::Page
  element :fld_email, 'label > input'
  element :fld_password, 'form > div:nth-child(4) > label > input'
  element :btn_sign_in, 'div.form__button-group > input'
  element :lbl_message, 'li.form-error__list-item'

  def login_url
    visit 'https://courses.ultimateqa.com/users/sign_in'
  end

  def login_user(email, password)
    fld_email email
    fld_password.set password
    btn_sign_in.click
  end
end
