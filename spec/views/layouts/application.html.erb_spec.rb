require 'rails_helper'

RSpec.describe 'Test rootpath', type: :view do
  it 'renders a link to home' do
    render template: 'home/index', layout: 'layouts/application'
    assert_select 'a[href=?]', root_path
  end
end
