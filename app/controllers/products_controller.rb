class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy,:show, :paycheck, :pay]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  before_action :set_card, only: [:paycheck, :pay, :show]

  require "payjp"

  def index
    @products = Product.includes(:images).order('created_at DESC').limit(5)
  end
  def show
    @saler_user = User.find(@product.saler_id)
    @category = Category.find(@product.categories_id)
    @shopping = Shippingcharges.find(@product.shopping_charge_id)
    @delivery_date = Delivarydate.find(@product.delivery_date_id)
  end  

  def new
    @product = Product.new
    @product.images.new  

    def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end

    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def create
    @product = Product.new(product_params)
    @product.saler_id = current_user.id
    if @product.save
      redirect_to root_path
    else
      session[:error] = @product.errors.full_messages
      redirect_to new_product_path
    end
  end

  def edit
    @productCategory = Category.find(@product.categories_id)
    @childCategory = @productCategory.parent
    @rootCategory = @productCategory.root
    @category_children = [@childCategory] 
    @rootCategory.children.each do |child|
      if child.name === @childCategory.name
        child.name = "---"
        child.id = "-"
      end
      @category_children << child
    end
    @category_parent_array = [@rootCategory.name]
    Category.where(ancestry: nil).each do |parent|
      if parent.name === @rootCategory.name
        parent.name = "---"
      end
      @category_parent_array << parent.name
    end
    @category_grandchildren_array = [@productCategory]
    @childCategory.children.each do |grandchild|
      if grandchild.name === @productCategory.name
        grandchild.name = "---"
      end
      @category_grandchildren_array << grandchild
    end
    def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end

    def get_category_grandchildren
      #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
    @images = @product.images
    if @images.empty?
      @product.images.new
    end
  end

  def update
    @productCategory = Category.find_by(name:params[:categories_id])
    @product.categories_id = @productCategory
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to edit_product_path(@product.id)
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end



  def paycheck
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
    amount:  @product.price,
    customer:  @card.customer_id,
    currency: 'jpy'
  )
  @product_buyer= Product.find(params[:id])
  @product_buyer.update( buyer_id: current_user.id)
  redirect_to root_path
  end

  private

  
  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :delivery_date_id, :shopping_charge_id,:categories_id, :prefecture_id,:bland, images_attributes: [:src, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end