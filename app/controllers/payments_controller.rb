class PaymentsController < ApplicationController

  def new
end

def create
 # Amount in cents
   @product =  Product.find(params[:product_id])
   @user = current_user

   token  = params[:stripeToken]

   begin
    charge = Stripe::Charge.create(
      amount: @product.price.to_i,
      currency: "cad",
      source: token,
      description: params[:stripeEmail],
      receipt_email: @user.email
    )

    if charge.paid
      Order.create(user_id: current_user.id, product_id: params[:product_id], total: @product.price.to_i)

    end


rescue Stripe::CardError => e
   # The card has been declined
   body = e.json_body
   err = body[:error]
   flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
 end
 redirect_to product_path(@product)


end
end
