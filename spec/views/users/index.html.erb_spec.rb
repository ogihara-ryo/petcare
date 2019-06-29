require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :nickname => "Nickname",
        :email => "Email",
        :password_digest => "Password Digest",
        :uid => "Uid"
      ),
      User.create!(
        :nickname => "Nickname",
        :email => "Email",
        :password_digest => "Password Digest",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
