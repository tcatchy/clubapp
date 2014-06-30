class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @sorted_events = @events.sort { |a,b| a.event_time <=> b.event_time }
  end

  def my_events
    if club_signed_in?
      @events = Event.where(club_id: current_club.id)
    elsif user_signed_in?
      @events = 1
    end
  end

  def follow
     @event = Event.find params[:event_id]
     @event.users << current_user
     @event.save
     redirect_to @event
  end

  def report
    @event = Event.find params[:event_id]
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find params[:id]
    @tickets = Ticket.where(event_id: @event.id)
    @comments = @event.comments.all
    @comment = @event.comments.build
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.club_id = current_club.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :event_type, :event_time, :location, :description, :image1, :image2, :image3)
    end
end
