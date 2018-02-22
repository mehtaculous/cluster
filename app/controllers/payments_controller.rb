class PaymentsController < ApplicationController

  def new
  end

  def create
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => Payment.price(current_user),
      :description => "#{current_user.name} - #{current_user.service} Package",
      :currency    => "usd"
    )

    Payment.create(
      :stripe_token       => params[:stripeToken],
      :stripe_customer_id => charge.customer,
      :user_id            => current_user.id,
      :amount             => Payment.price(current_user) / 100,
      :package            => current_user.service
    )

    amount = Payment.price(current_user) / 100

    flash[:notice] = "Your payment of $#{amount} for the Clutter #{current_user.service} Package has been successfully completed. Thank you!"
    redirect_to edit_user_registration_path(current_user)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end