class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(restaurant_id: params[:restaurant_id])
  end

  def create
    @event = Event.new(event_params)

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

  def update
    @event = Event.find(params[:id])
      respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :day, :beginning, :end, :restaurant_id)
  end
end
