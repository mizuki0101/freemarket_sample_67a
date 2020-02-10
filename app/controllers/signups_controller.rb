class SignupsController < ApplicationController
  def new
  end

  def member
    @user = User.new
  end

  def address
    # binding-pry
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = params[:birthday]["birthday(1i)"]
    session[:birth_month] = params[:birthday]["birthday(2i)"]
    session[:birth_date] = params[:birthday]["birthday(3i)"]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_date: session[:birth_date],
      phonenumber: "08026259178"
    )
    unless @user.valid?
      render 'signups/step1'
    end
    @address = Address.new
  end

  def telephone
    session[:send_family_name] = address_params[:send_family_name]
    session[:send_first_name] = address_params[:send_first_name]
    session[:send_family_name_kana] = address_params[:send_family_name_kana]
    session[:send_first_name_kana] = address_params[:send_first_name_kana]
    session[:postnumber] = address_params[:postnumber]
    session[:prefecture_id] = address_params[:prefecture_id]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building] = address_params[:building]
    session[:phonenumber] = address_params[:phonenumber]
    @user = User.new
    @address = Address.new(
      user: @user,
      send_family_name: session[:send_family_name],
      send_first_name: session[:send_first_name],
      send_family_name_kana: session[:send_family_name_kana],
      send_first_name_kana: session[:send_first_name_kana],
      postnumber: session[:postnumber],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      house_number: session[:house_number],
      building: "苺ビル",
      phonenumber: "08026259178"
    )
    unless @address.valid?
      render '/signups/step2'
    end
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email], 
      phonenumber: telephone_params[:phonenumber],
      password: session[:password], 
      password_confirmation: session[:password_confirmation], 
      family_name: session[:family_name], 
      first_name: session[:first_name], 
      family_name_kana: session[:family_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birth_year: session[:birth_year], 
      birth_month: session[:birth_month], 
      birth_date: session[:birth_date] 
    )
    unless @user.valid?
      return render '/signups/step3'
    end

    @user.save

    @address = Address.create(
      user: @user,
      send_family_name: session[:send_family_name],
      send_first_name: session[:send_first_name],
      send_family_name_kana: session[:send_family_name_kana],
      send_first_name_kana: session[:send_first_name_kana],
      postnumber: session[:postnumber],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      house_number: session[:house_number]
    )



  end

  def login
  end

  private

    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana)
    end

    def address_params
      params.require(:address).permit(:send_family_name, :send_first_name, :send_family_name_kana, :send_first_name_kana, :postnumber, :prefecture_id, :city, :house_number, :building, :phonenumber)
    end

    def telephone_params
      params.require(:user).permit(:phonenumber)
    end
end