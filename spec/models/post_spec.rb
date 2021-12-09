require "rails_helper"

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: "chris@example.com", password: "password", password_confirmation: "password")
  it "has a title" do
    post = Post.new(
      title: "",
      body: "Valid body",
      user: current_user,
      views: 0,
    )

    expect(post).to_not be_valid
    post.title = "Has a title"
    expect(post).to be_valid
  end

  it "has a body" do
    post = Post.new(
      title: "Valid title",
      body: "",
      user: current_user,
      views: 0,
    )
    expect(post).to_not be_valid
    post.body = "Has a body"
    expect(post).to be_valid
  end

  it "has a title at least 2 characters long" do
    post = Post.new(
      title: "",
      body: "Valid body",
      user: current_user,
      views: 0,
    )
    expect(post).to_not be_valid
    post.title = "12"
    expect(post).to be_valid
  end
  it "has a body between 5 and 100 characters" do
    post = Post.new(
      title: "Valid title",
      body: "",
      user: current_user,
      views: 0,
    )
    expect(post).to_not be_valid
    post.body = "12345"
    expect(post).to be_valid

    hundred_char_string = "DN3xrV8BISJkM9iXH0pJEIZ6HRShfudoAHZ8wkpfNe7oqhtB1t1SEkGRA5sA1xCVF0vGYAZHGUutv3W3DxJL6sDw5JvFR8WQOy83"
    post.body = hundred_char_string
    expect(post).to be_valid
    post.body = hundred_char_string + "1"
    expect(post).to_not be_valid
  end
  it "has numerical values" do
    post = Post.new(
      title: "Valid title",
      body: "Valid body",
      user: current_user,
      views: 0,
    )
    expect(post.views).to be_a(Integer)
  end
end
