# [C L U T T E R](https://clutterrfree.herokuapp.com)

A professional organizing service dedicated to teaching individuals how to declutter and maintain their personal space


## Getting Started

1. Clone Repo
   ```
   git clone git@github.com:mehtaculous/clutter.git
   ```

2. Install Gems
   ```
   bundle install --without production
   ```

3. Run Migrations
   ```
   rake db:migrate
   ```

4. Configure Sendgrid Email **([Documentation](https://devcenter.heroku.com/articles/sendgrid))**

   ##### config/application.yml
   ```
   SENDGRID_USERNAME: example@heroku.com
   SENDGRID_PASSWORD: 12345678abcdefgh
   ```

5. Configure Stripe Payment **([Documentation](https://stripe.com/docs/checkout/rails))**

   ##### config/application.yml
   ```
   STRIPE_PUBLISHABLE_KEY: pk_test_abcdef123456
   STRIPE_SECRET_KEY: sk_test_abcdef123456
   ```

4. Run It Locally
   ```
   rails s
   ```