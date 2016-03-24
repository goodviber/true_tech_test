require 'rails_helper'

RSpec.describe Tweet, :type => :model do
   describe Tweet do
     it "has a valid factory" do
       expect(FactoryGirl.build(:tweet)).to be_valid
     end

     it "is valid with a title, body and user" do
       tweet = FactoryGirl.build(:tweet)
       expect(tweet).to be_valid
     end
     it "is invalid without a title" do
       tweet = FactoryGirl.build(:tweet, title: nil)
       tweet.valid?
       expect(tweet.errors[:title]).to include("can't be blank")
     end
     it "is invalid without a body" do
       tweet = FactoryGirl.build(:tweet, body: nil)
       tweet.valid?
       expect(tweet.errors[:body]).to include("can't be blank")
     end
   end
end
