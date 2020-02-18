class MypageController < ApplicationController
  def index
    @user = User.all
  end

  def ausstellen
  end

  def deal
  end

  def verkauf
  end

  def logout
  end

  def profile
    @user = User.all
    # @address = Address.where(current_user.id)
  end

  def person
  end

  def addressconfirmation
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @address = Address.find(params[:id])
  #   if @address.update(address_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end
end
