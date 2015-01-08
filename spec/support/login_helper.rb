def sign_in
  set_omniauth
  visit "/"
  click_link "Sign in"
end
