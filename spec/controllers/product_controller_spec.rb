require 'rails_helper'

describe ProductsController, type: :controller do


  context 'POST #create' do


    let(:user2) { FactoryBot.create(:admin) }
    before do
     sign_in user2

    end

        it "creates a new product if all fields appropriate and leaves message of success" do
          params = {
            name: "aa", description: "aa", image_url: "http://www.remadays.com/wp-content/uploads/2016/11/Picture_online-2015.jpg", colour: "dd", price: 3.33
          }
          expect{post :create, params: {product: params}}.to change(Product,:count).by(1)
          expect(assigns(:product)).to be_a(Product)
          expect(response).to redirect_to product_path(1)
          expect(flash[:notice]).to eq 'Product was successfully created.'
        end

        it "does not save new Product and renders new template if all attributes not present " do
          params = {
            name: "aa", description: "aa", image_url: "http://www.remadays.com/wp-content/uploads/2016/11/Picture_online-2015.jpg", colour: "dd"
          }
          expect{post :create, params: {product: params}}.to change(Product,:count).by(0)
          expect(response).to render_template :new
        end
     end

     context 'PATCH #update' do

       let(:product) { FactoryBot.create(:product) }
       let(:user2) { FactoryBot.create(:admin) }
       before do
        sign_in user2
        @product = product
       end

           it "updates an attribute of a product if fields match data-types and shows message of success" do
             params = {
               name: "Jimmy", description: "Hoffa", image_url: "http://www.remadays.com/wp-content/uploads/2016/11/Picture_online-2015.jpg", colour: "brown", price: 1.99
             }
            expect{patch :update, params: {id: @product, product: params}}.to change(Product,:count).by(0)
            product.reload
            expect(product.colour).to eq("brown")
            expect(flash[:notice]).to eq 'Product was successfully updated.'

           end

           it "does not update product with field(s) wrong data-type and renders edit template " do
             params = {
               name: "Jimmy", description: "Hoffa", image_url: "http://www.remadays.com/wp-content/uploads/2016/11/Picture_online-2015.jpg", colour: "brown", price: "eee"
             }
             expect{patch :update, params: {id: @product, product: params}}.to change(Product,:count).by(0)
            expect(response).to render_template :edit

           end
        end


      context 'GET #new' do

        let(:user2) { FactoryBot.create(:admin) }
        before do
         sign_in user2
        end

        it 'should success and render new page' do
          get :new
          expect(response).to have_http_status(200)
          expect(response).to render_template :new

        end
      end


     context 'GET #index' do
       it 'should success and render to index page' do
         get :index
         expect(response).to have_http_status(200)
         expect(response).to render_template :index

       end
     end

     context 'GET #show' do
        let(:product) { FactoryBot.create(:product) }

        it 'should success and render to show page' do
          get :show, params: { id: product.id }
          expect(response).to have_http_status(200)
          expect(response).to render_template :show
        end
      end


      context 'DELETE #destroy' do

          let(:product) { FactoryBot.create(:product) }
          let(:user2) { FactoryBot.create(:admin) }
          before do
           sign_in user2
           @product = product
          end
        it 'should delete product and show message' do
          expect{delete :destroy, params: {id: @product}}.to change(Product,:count).by(-1)
          expect(flash[:notice]).to eq 'Product was successfully destroyed.'

        end
      end

  end
