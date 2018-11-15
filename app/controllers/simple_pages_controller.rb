class SimplePagesController < ApplicationController
  def index
  end

  def contact
  end

  def about
  end

  def landing_page
    @products = Product.all
  end

  def admin
    if current_user
      @user = current_user.id
    else
      redirect_to orders_path
    end
  end


  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
=begin
    ActionMailer::Base.mail(from: @email,
      to: 'bohdanlaluck@hotmail.com',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
=end
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end


end
