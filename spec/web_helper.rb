def post_a_message
  visit('/messages/new')
  fill_in 'content', with: 'peep'
  click_button 'Send message'
end

def post_multiple_message
  visit('/messages/new')
  fill_in 'content', with: 'first message'
  click_button 'Send message'
  visit('/messages/new')
  fill_in 'content', with: 'second message'
  click_button 'Send message'
end

def sign_up(email: 'cat@example.com', password: 'h1232323', password_confirmation: 'h1232323')
  visit('/users/new')
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'cat@example.com', password: 'h1232323')
  visit('/users/signin')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
