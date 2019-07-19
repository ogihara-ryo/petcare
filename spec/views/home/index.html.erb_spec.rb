require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  it 'renders a link to users' do
      render
      assert_select "a[href=?]" , users_path
    end
end
