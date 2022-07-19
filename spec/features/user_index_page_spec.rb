require 'rails_helper'

RSpec.describe 'Post index page test', type: :feature do
  before :all do
    first_user = User.create(
      name: 'Sediq',
      photo: 'https://unsplash.com/6519861_z.jpg',
      bio: 'A teacher',
      created_at: '2022-07-15 01:40:30.027196000 +0000',
      updated_at: '2022-07-16 21:22:04.937699'
    )
    second_user = User.create(
      name: 'Emily',
      photo: 'https://unsplash.com/6519861_z.jpg',
      bio: 'A teacher from Poland',
      created_at: '2022-07-15 01:40:30.027196000 +0000',
      updated_at: '2022-07-16 21:22:04.937699'
    )
    Post.create(user_id: first_user, title: 'First Post', text: 'This is my first post')
    Post.create(user_id: first_user, title: 'Second Post', text: 'This is my second post')
    post = Post.first
    Comment.create(user_id: second_user, post_id: post, text: 'Hi Tom!!')
    Comment.create(user_id: second_user, post_id: post, text: 'Hi Tom!!')
  end

  it 'I can see the username of all other users.' do
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'The profile picture for each user should be visible.' do
    User.all.each do |user|
      expect(page.has_xpath?("//img[@src = '#{user.photo}' ]"))
    end
  end

  it 'I can see the number of posts each user has written.' do
    User.all.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it 'When I click on a user, I am redirected to that users show page.' do
    find_link(User.first.name).click
    expect(page).to have_current_path("/users/#{User.first.id}")
  end
end
