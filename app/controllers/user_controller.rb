# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to request.referrer if @user.save
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
