# # app/controllers/bookings_controller.rb
# class BookingsController < ApplicationController
#     before_action :authenticate_user!

#     def index
#         @bookings = current_user.bookings
#     end
  
#     def new
#       @event = Event.find(params[:event_id])
#       @booking = Booking.new
#       @available_equipment = @event.equipments.where(availability: true)
#     end
  
#     def create
#       @booking = current_user.bookings.new(booking_params)
#       if @booking.save
#         redirect_to @booking, notice: 'Booking was successfully created.'
#       else
#         render :new
#       end
#     end
  
#     private
  
#     def booking_params
#       params.require(:booking).permit(:event_id, equipment_ids: [])
#     end
#   end
  


class BookingsController < ApplicationController
    before_action :authenticate_user! # Ensure user is authenticated
    before_action :set_booking, only: %i[show edit update destroy]
    before_action :set_collections, only: %i[new edit create update]
  
    # GET /bookings
    def index
      @bookings = current_user.bookings
    end
  
    # GET /bookings/1
    def show
    end
  
    # GET /bookings/new
    def new
      @booking = Booking.new
      @event = Event.find(params[:event_id])
      @equipments = @event.equipments.where(availability: true)
      @events = Event.all
      @venues = Venue.all
    end
  
    # GET /bookings/1/edit
    def edit
        @events = Event.all
        @event = Event.find(params[:event_id])
        @equipments = Equipment.where(availability: true)
        @venues = Venue.all
    end
  
    # POST /bookings
    def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user
    
        if @booking.save
          redirect_to @booking, notice: 'Booking was successfully created.'
        else
          Rails.logger.debug @booking.errors.full_messages
          flash[:alert] = @booking.errors.full_messages.to_sentence
          render :new
        end
      end
  
    # PATCH/PUT /bookings/1
    def update
        if @booking.update(booking_params)
          redirect_to @booking, notice: 'Booking was successfully updated.'
        else
          flash[:alert] = @booking.errors.full_messages.to_sentence
          render :edit
        end
      end
  
    # DELETE /bookings/1
    def destroy
      @booking.destroy
      redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_collections
        @events = Event.all
        @equipments = Equipment.where(availability: true)
        @venues = Venue.all
      end
  
    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:event_id, :user_id, :status, :venue_id, :date, equipment_ids: [])
    end
  end
  