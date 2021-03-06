# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @upcoming_events = Event.upcoming.order(date: :desc)
    @past_events = Event.past.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @attendees = Invitation.where(event_id: @event.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :decription, :url, :date)
  end
end
