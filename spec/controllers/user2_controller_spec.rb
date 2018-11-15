require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:admin) }


  describe 'GET #show' do

     context 'when user1 is logged in' do
       before do
        sign_in user
       end
        it "cannot load show page of user2" do
          get :show, params: { id: user2.id }
          expect(response).to redirect_to(root_path)
        end
     end


  end

end
