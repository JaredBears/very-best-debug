class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(:created_at)

    render({ :template => "venue_templates/venue_list" })
  end

  def show
    venue_id = params.fetch("venue_id")
    @the_venue = Venue.find(venue_id)

    render({ :template => "venue_templates/details" })
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save

    redirect_to("/venues/#{@venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")
    @venue = Venue.find(the_id)
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save
    
    redirect_to("/venues/#{@venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    venue = Venue.find(the_id)
    venue.destroy

    redirect_to("/venues")
  end

end
