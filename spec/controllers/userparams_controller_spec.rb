require 'rails_helper'

RSpec.describe UserparamsController, type: :controller do
   let!(:user) { build(:user, email: "test@gmail.com") }

login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe 'GET #new' do
    it "should find current_user and open form for create Profile" do
      get :new
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)     
    end
  end

  describe 'POST #create' do
    it "should create profile and redirect to index page" do
      post :create, params: {profile: {nickname:"Tester"}}
      expect(subject.current_user.profile.nickname).to eq("Tester")
      expect(response).to redirect_to root_path
    end
  end
  
end
