class EventAttendeesController < ApplicationController
  before_action :set_event_attendee, only: [:show, :edit, :update, :destroy]

  # GET /event_attendees
  def index
    @event_attendees = EventAttendee.all
  end

  # GET /event_attendees/1
  def show
  end

  # GET /event_attendees/new
  def new
    @event_attendee = EventAttendee.new
  end

  # GET /event_attendees/1/edit
  def edit
  end

  # POST /event_attendees
  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    if @event_attendee.save
      redirect_to @event_attendee, notice: 'Event attendee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_attendees/1
  def update
    if @event_attendee.update(event_attendee_params)
      redirect_to @event_attendee, notice: 'Event attendee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /event_attendees/1
  def destroy
    @event_attendee.destroy
    redirect_to event_attendees_url, notice: 'Event attendee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_attendee
      @event_attendee = EventAttendee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_attendee_params
      params.require(:event_attendee).permit(:voting_setting, :meeting_status, :order_of_appearance, :council_member_id, :event_id)
    end
end
