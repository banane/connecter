require "spec_helper"

describe Person do
#  it { should have_many(:people).through(:followed_people) }
  it { should respond_to(:get_image) }
  it { should respond_to(:is_following) }

  let(:person) { FactoryGirl.create(:person) }

  context " get_image" do
    it "returns placeholder" do
      person.get_image.should eql("placeholder.png")
    end

    it "returns photo url" do
      person.profile_photo = Faker::Internet.url
      person.get_image.should eql(person.profile_photo)
    end
  end

  context "is following someone" do
    let(:non_follower) { FactoryGirl.create(:person) }
    let(:follower) { FactoryGirl.create(:person) }
    let(:followship) { FactoryGirl.create(:followed_person, :person_id => person.id,
    :followed_person_id => follower.id )}

    before(:all) do
      followship.save
    end

    it " true" do
      person.is_following(follower.id).should be_true
    end
    it " false" do
      person.is_following(non_follower.id).should be_false
    end
  end
end