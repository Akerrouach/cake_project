Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_zZS2yRdkpTWcZ36KGJVT4YJr'],
  :secret_key      => ENV['sk_test_fcDZj6lWxT6rzz3oDqQHnL2X']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]