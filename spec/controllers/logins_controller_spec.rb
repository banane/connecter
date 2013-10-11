require "spec_helper"

describe Api::V1::LoginsController do
  let(:person) { FactoryGirl.create(:person) }

  context "index" do
    it "get" do
      get :index
      response.should be_success
      response.should render_template("api/v1/logins/index")
    end
  end
  context "create" do

    it "attending" do
      post :create, { :email => person.email, :format => :json }

      resp = JSON.parse(response.body)
      resp["person"]["email"].should eql(person.email)
      resp["person"]["id"].should eql(person.id)
      resp["status"].should eql(200)
      resp["success"].should eql(true)

      response.should be_success

      lambda { sign_in person }.should change { current_user }.from(nil).to(person)
    end
    it "not attending" do
      post :create, { :email => Faker::Internet.email, :format => :json }
      resp = JSON.parse(response.body)
      resp["reason"].should eql("Invalid email or password.")
    end
  end

end