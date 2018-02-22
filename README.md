# [C L U T T E R](https://clutterrfree.herokuapp.com)

A professional organizing service dedicated to teaching individuals how to declutter and maintain their personal space

## Getting Started

1. Cloning Repo
   ```
   git clone git@github.com:mehtaculous/clutter.git
   ```

2. Installing Gems
   ```
   bundle install --without production
   ```

3. Running Migrations
   ```
   rake db:migrate
   ```

4. Configuring Sendgrid Email
   #### [Setup Documentation](https://sendgrid.com/docs/Integrate/Frameworks/rubyonrails.html)
   
   config/application.yml
   ```
   SENDGRID_USERNAME: example@heroku.com
   SENDGRID_PASSWORD: 123456789
   ```

5. Configuring Stripe Payment
   #### [Setup Documentation](https://stripe.com/docs/checkout/rails)

   config/application.yml
   ```
   STRIPE_TEST_PUBLISHABLE_KEY: pk_test_abcdef123456
   STRIPE_TEST_SECRET_KEY: sk_test_abcdef123456
   ```

6. Running It Locally
   ```
   rails s
   ```