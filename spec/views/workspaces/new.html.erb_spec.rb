require 'rails_helper'

RSpec.describe 'workspaces/new', type: :view do
  let(:manifest) { create(:manifest) }
  before(:each) do
    assign(:collection, create(:collection, manifests: [manifest]))
    assign(:workspace, Workspace.new)
  end

  before { render }

  it 'renders the heading' do
    expect(rendered).to have_css('h1', text: 'New Workspace')
  end

  it 'renders a mirador script tag' do
    expect(rendered).to have_css('script', text: /Mirador/, visible: false)
    expect(rendered).to have_css('script', text: /#{manifest.url}/, visible: false)
  end

  it 'renders a back link' do
    expect(rendered).to have_link 'Back'
  end
end