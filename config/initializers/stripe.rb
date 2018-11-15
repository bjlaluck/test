if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_u198xPsg5eKEC65GQGmcBCuD',
    secret_key: 'sk_test_9QodL7Ebs6XdfYUerKdjErhj'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
