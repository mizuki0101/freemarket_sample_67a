class PurchaseController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:index, :pay]

  def index
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    @product = Product.find(1)
    @product_price = (@product.price.to_i).round
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    Payjp::Charge.create(
    :amount => 13500, #itemテーブルの金額を入れる
    :customer => @card.customer_id, 
    :currency => 'jpy', 
  )
  @product_buyer= Product.find(1)
  @product_buyer.update( buyer_id: current_user.id)
  redirect_to root_path

  end

  private

  def set_card
    @card = Card.includes(:user).find_by(user_id: current_user.id)
  end

end