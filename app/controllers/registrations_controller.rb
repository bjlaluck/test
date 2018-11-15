class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super do
        @email = resource.email
        UserMailer.new_user_form(@email).deliver_now


=begin
      ActionMailer::Base.mail(from: 'bohdanlaluck@hotmail.com',
        to: @email,
        subject: "#{@name}, Welcome to Bikes Berlin",
        body: 'Test').deliver_now
=end



    end
  end

  def update
    super
  end
end
