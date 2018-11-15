class UserMailer < ApplicationMailer

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'bohdanlaluck@hotmail.com',
         subject: "A new contact form message from #{name}")
  end

  def new_user_form(email)
      mail(from: "bohdanlaluck@hotmail.com",
         to: email,
         subject: "Thanks for signing up.")
  end

  def order_receipt(email, order_id, product_name, order_total)
    @product_name = product_name
    @order_id = order_id
    @order_total = order_total
    mail(from: "bohdanlaluck@hotmail.com",
       to: email,
       subject: "Your order receipt from Bikes Berlin")
  end
end
