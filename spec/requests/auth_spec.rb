require 'rails_helper'

RSpec.describe "Auths", type: :request do
  context "when login" do
    let(:url) { "/user/login" }
    let(:valid_params) do {
        email: "validemail@mail.com",
        password: "password"
      } end
    it "LogsIn the user and returns the token" do
      @user = FactoryBot.create(:user)
      post url, :params => valid_params
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['token']).to be_present
    end
    it "returns unauthorized(wrong email)" do
      @user = FactoryBot.create(:user)
      valid_params[:password] = "wrongpassword"
      post url, :params => valid_params
      expect(response).to have_http_status(:unauthorized)
    end
    it "returns unauthorized(wrong password)" do
      @user = FactoryBot.create(:user)
      valid_params[:email] = "qwer@afd.com"
      post url, :params => valid_params
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
