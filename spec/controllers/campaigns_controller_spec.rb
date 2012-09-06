require 'spec_helper'

describe CampaignsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:campaign) { FactoryGirl.create(:campaign) }

    it "returns http success" do
      get 'show', id: campaign
      response.should be_success
    end
  end

end
