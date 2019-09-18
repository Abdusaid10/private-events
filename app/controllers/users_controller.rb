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
    @events = @user.events
    # @upcoming_events = @user.events.upcoming.order(date: :desc)
    # @past_events = @user.events.past.order(date: :desc)
    @upcoming_evs = Event.where('date > ?', DateTime.now).order(date: :desc)
    @past_evs = Event.where('date < ?', DateTime.now).order(date: :desc)
    @invited = Event.joins(:attendance).where(attendances: { 'user_id' => current_user.id })
    @u_events_invited = @invited.where(date: @upcoming_evs)
    @p_events_invited = @invited.where(date: @past_events)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
