class PurchaseController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:index, :pay]
  before_action :set_product, only: [:index, :pay]

  def index
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    Payjp::Charge.create(
    :amount => @product.price, #itemテーブルの金額を入れる
    :customer => @card.customer_id, 
    :currency => 'jpy', 
  )
  redirect_to root_path

  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end


end