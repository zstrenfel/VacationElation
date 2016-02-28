class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  #POST /plantrips.json
  def planTrips
      date_start = params[:date_start]
      date_end = params[:date_end]
      start_airport = params[:start_airport]
      tags = params[:tags]

      hash = {}
      hash[:date_start] = date_start
      hash[:date_end] = date_end
      hash[:departure_airport] = start_airport

      #find match destinations in descending order
      match_destinations = Destination.matchTags(tags, start_airport)

      @ret_trips = []
      #contruct new Trip objects      
      match_destinations.each do |md|
        depart = ExpediaWS.findCheapestFlightToDest(start_airport, md, date_start)
        depart_price = depart[:price]
        return_price = ExpediaWS.findCheapestFlightFromDest(md, start_airport, date_end)
        #build a new Trip here
        hash[:depart_price] = depart_price
        hash[:return_price] = return_price
        hash[:destination_id] = md.id
        o = Trip.collection.insert_one(hash)
        @ret_trips << Trip.find(o.inserted_id)
      end
  end

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @destination = Destination.find(@trip.destination_id)
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.fetch(:trip, {})
    end
end
