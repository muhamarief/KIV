class BraintreeController < ApplicationController
  # before_action :require_login

  def new
    @client_token = Braintree::ClientToken.generate
    # @reservation = Reservations.find(params[:id])
    # @payment = Payment.new
  end

  # def checkout
  #   amount = params[:payment][:total_price]
  #   nonce = params[:payment_method_nonce]
  #
  #   # render action: :new and return unless nonce
  #
  #   @result = Braintree::Transaction.sale(
  #     amount: amount,
  #     payment_method_nonce: params[:payment_method_nonce]
  #   )
  #
  #   if @result.success?
  #     Payment.create(reservation_id: params[:payment][:reservation_id], braintree_payment_id: @result.transaction.id, status: @result.transaction.status, fourdigit: @result.transaction.credit_card_details.last_4)
  #
  #       redirect_to reservation_path(:id => params[:payment][:reservation_id]), notice: "Congratulations! Your transaction is successful!"
  #   else
  #       Payment.create(reservation_id: params[:payment][:reservation_id], braintree_transaction_id: @result.transaction.id, status: @result.transaction.status, fourdigit: @result.transaction.credit_card_details.last_4)
  #       flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
  #       @client_token = Braintree::ClientToken.generate
  #       @reservation = Reservation.find(params[:payment][:reservation_id])
  #       @payment = Payment.new
  #       render :new
  #   end
  # end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    @booking = Booking.find(params[:booking_id])
    amount = @booking.total_price


    result = Braintree::Transaction.sale(
     :amount => amount, #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      @booking.paid_status = true
      @booking.save
      @booking.seats.each do |seat|
        seat.booking_status = true
        seat.save
      end
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
