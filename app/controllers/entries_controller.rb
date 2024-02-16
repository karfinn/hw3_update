class EntriesController < ApplicationController

  def show
    # renders new entry
    @place = Place.find_by({"id" => params["id"]})
    @entries = Entry.find_by({"id" => @entry["place_id"]})
  end
  
  def new
    # shows new entry, connects to places
    @entries = Entry.find_by({"id" => params["place_id"]})
  end 
  
  def create
    @entries =Entry.new
 
    # creates user-entered form data to Entry's columns, look at schema for data fields
    @entries["title"] = params["title"]
    @entries["description"] = params ["description"]
    @entries["posted_on"] = params ["posted on"] 
    # create relationship between Entry and Places
    @entries["place_id"] = params["place_id"]
    #save
    @entries.save
    #redirect user to home page
    redirect_to "/places/#{@entries["place_id"]}"
  end 

end
