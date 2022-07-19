require 'rails_helper'

RSpec.describe 'User show page test', type: :feature do
  it 'I can see the user\'s profile picture.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')

    visit "/users/#{user.id}"
    expect(page).to have_xpath("//img[@src = '#{user.photo}' ]")
  end

  it 'I can see the user\'s username.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')

    visit "/users/#{user.id}"
    expect(page).to have_content('Sediq')
  end

  it 'I can see the number of posts the user has written.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')
    post = Post.create(title: 'My first post', text: 'This is my first post', user_id: user.id)

    visit "/users/#{user.id}"
    expect(page).to have_content('Number of posts:1')
  end

  it 'I can see the user\'s bio.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')

    visit "/users/#{user.id}"
    expect(page).to have_content('A teacher')
  end

  it 'I can see the user\'s first 3 posts.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')
    post = Post.create(title: 'My first post', text: 'This is my first post', user_id: user.id)
    post = Post.create(title: 'My second post', text: 'This is my second post', user_id: user.id)
    post = Post.create(title: 'My third post', text: 'This is my third post', user_id: user.id)
    post = Post.create(title: 'My fourth post', text: 'This is my fourth post', user_id: user.id)

    visit "/users/#{user.id}"
    expect(page).to_not have_content('My first post')
    expect(page).to have_content('My second post')
    expect(page).to have_content('My third post')
    expect(page).to have_content('My fourth post')
  end

  it 'I can see a button that lets me view all of a user\'s posts.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')
    post = Post.create(title: 'My first post', text: 'This is my first post', user_id: user.id)

    visit "/users/#{user.id}"
    expect(page).to have_button('See all posts')
  end

  it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')
    post = Post.create(title: 'My first post', text: 'This is my first post', user_id: user.id)

    visit "/users/#{user.id}"
    click_on 'View Post'
    expect(page).to have_current_path("/users/#{user.id}/posts/#{post.id}")
  end

  it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')
    post = Post.create(title: 'My first post', text: 'This is my first post', user_id: user.id)

    visit "/users/#{user.id}/posts"
    click_on 'See all posts'
    expect(page).to have_current_path("/users/#{user.id}/posts")
  end

  it 'I can see a button that lets me view all of a user\'s posts.' do
    user = User.create(name: 'Sediq', photo: 'https://unsplash.com/6519861_z.jpg', bio: 'A teacher')
    post = Post.create(user_id: user.id, title: 'My first post', text: 'This is my first post')

    visit "/users/#{user.id}"
    expect(page).to have_button('See all posts')
  end
end
