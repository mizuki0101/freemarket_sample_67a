class PurchaseController < ApplicationController

  require "payjp"

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
    Payjp::Charge.create(
    :amount => 13500, #itemテーブルの金額を入れる
    :customer => card.customer_id, 
    :currency => 'jpy', 
  )
  #トップページに変更すること
  redirect_to action: 'done' 
  end

end