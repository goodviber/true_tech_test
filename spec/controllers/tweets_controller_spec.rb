require 'rails_helper'

RSpec.describe TweetsController, :type => :controller do

  context "with logged in user" do
    login_user

    describe "GET #show" do
      it "renders the show template" do
        tweet = FactoryGirl.create(:tweet)
        get :show, id: tweet
        expect(response).to render_template :show
      end
    end

    describe "Get #index" do
      it "renders the index template" do
        tweet = FactoryGirl.create(:tweet)
        get :index
        expect(response).to render_template :index
      end
    end

    describe "POST #create" do
      it "saves the new tweet in the database" do
        post :create, tweet: FactoryGirl.attributes_for(:tweet)
        expect(response).to redirect_to root_path
      end
    end

    describe "POST #create" do
      it "redirects to home page" do
        post :create, tweet: FactoryGirl.attributes_for(:tweet)
        expect(response).to redirect_to root_path
      end

      it "saves tweet in database" do
        expect{
           post :create, tweet: FactoryGirl.attributes_for(:tweet)
         }.to change(Tweet, :count).by(1)
      end
    end
  end

  context "when NOT signed in" do
    describe "Get #index" do
      it "Redirects to sign in" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
