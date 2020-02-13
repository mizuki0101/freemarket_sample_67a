class CardController < ApplicationController
  require "payjp"
  before_action :get_payjp_info, only: [:new, :pay, :delete, :show]
  before_action :set_card, only: [:new, :show, :delete, :index]


  def index
    if @card.present?
      redirect_to card_path(@card)
    end
  end

  def new
    if @card.present?
      redirect_to card_path(@card)
    end
  end

  def pay 
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(@card)
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete 
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to action: "new"
  end

  def show 
    if @card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def get_payjp_info
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
  end

  def set_card
    @card = Card.includes(:user).find_by(user_id: current_user.id)
  end

end
