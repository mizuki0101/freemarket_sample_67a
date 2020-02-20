class MypageController < ApplicationController
  def index
    @user = User.all
  end

  def ausstellen
    @products = Product.where(saler_id: current_user.id)
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



  def edit
    @user = User.find(params[:id])
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    # binding.pry
    if @address.update(address_params)
      redirect_to mypage_index_path
    else
      render :edit
    end
  end


  private

  def address_params
    params.require(:address).permit(:send_family_name, :send_first_name, :send_family_name_kana, :send_first_name_kana, :postnumber, :prefecture_id, :city, :house_number, :building, :phonenumber)
  end
end
