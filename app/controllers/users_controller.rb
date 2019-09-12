# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # @events = @user.events
    @upcomming_events = @user.events.upcomming.order(date: :desc)
    @past_events = @user.events.past.order(date: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
