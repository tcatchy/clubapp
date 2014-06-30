class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  def reserve
    @ticket = Ticket.find params[:id]
    @event = Event.find params[:event_id]
    @ticket.users << current_user
    @ticket.count -= 1
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @event, notice: 'Ticket was successfully reserved.' }
        format.json { render :show, status: :reserved, location: @event }
      else
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tickets/new
  def new
    @event = Event.find params[:event_id]
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.count = @ticket.number
    @event = Event.find(params[:event_id])

    respond_to do |format|
      if @ticket.save
        @event.tickets << @ticket
        @event.save
        format.html { redirect_to @event, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      @event = Event.find(params[:id])
      @ticket.count = @ticket.number
      if @ticket.update(ticket_params)
        format.html { redirect_to @event, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    @event = Event.find(params[:event_id])
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Ticket was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:number, :price, :start_date, :end_date, :purchase_location, :description)
    end
end
