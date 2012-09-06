require 'spec_helper'

describe DesignersController do

  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  before { setup_designer }

  it "should render designer status presenter" do
    get :show, id: @designer.id
    response.should be_success
    response.body.should have_css('section.designer-status .active-projects', text: '3')
  end

end
