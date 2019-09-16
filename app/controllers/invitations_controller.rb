# frozen_string_literal: true

class InvitationsController < ApplicationController
  def index; end

  def new
    @invitation = Invitation.new
  end

  def create
    event = Event.find(params[:invitation][:event])
    user = User.find_by(email: params[:invitation][:invited_user])

    @invitation = Invitation.new

    if user && user.events_as_attendee.find_by(id: event.id).nil? && user.invitations_received.find_by(event: event).nil?
      @invitation = current_user.invitations.new(event: event, invited_user: user)
    elsif user
      flash.now[:notice] = 'User already invited'
    else
      flash.now[:notice] = "User doesn't exist"
    end

    if @invitation.save
      flash[:notice] = 'Invitation sent'
      redirect_to root_url
    else
      render :new
    end
  end

  def show; end

  def destroy
    @invitation = Invitation.find(params[:id]).destroy
    flash[:notice] = 'Invitation declined'
    redirect_to root_url
  end
end