require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe 'post #create' do
    before { post :create, :user }
    it 'redirect root' do
      expect(response).to redirect_to(root_path)
    end
  end
end
