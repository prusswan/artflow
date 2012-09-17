require "spec_helper"

describe Notifier do
  describe "creation_added" do
    let(:mail) { Notifier.creation_added(FactoryGirl.create(:creation)) }

    it "renders the headers" do
      mail.subject.should eq("Creation Added")
      mail.to.should eq(["test@artflowme.com"])
      mail.from.should eq(["artflow@artflowme.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Thank you for using")
    end
  end

end
