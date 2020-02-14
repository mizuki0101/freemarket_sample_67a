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
end
