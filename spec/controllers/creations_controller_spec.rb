require 'spec_helper'

describe CreationsController do

  let(:user) { FactoryGirl.create(:designer) }

  describe "access control" do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to new_designer_session_path
    end
  end

  describe "GET 'index'" do
    before { sign_in user }

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:creation) { FactoryGirl.create(:creation) }

    before { sign_in user }

    it "returns http success" do
      get 'show', id: creation
      response.should be_success
    end
  end

  describe "POST 'create'" do
    let(:creation) { FactoryGirl.attributes_for(:creation) }

    before do
      FactoryGirl.create(:project)
      sign_in user
    end

    it "should create a creation" do
      lambda do
        post :create, creation: creation
        response.should redirect_to creation_path(assigns(:creation))
      end.should change(Creation, :count).by(1)
    end
  end

  describe "GET 'permissions'" do
    let(:creation) { FactoryGirl.create(:creation) }

    before { sign_in user }

    it "returns http success" do
      get 'permissions', id: creation
      response.should be_success
    end
  end

end
