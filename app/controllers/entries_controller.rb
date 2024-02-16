class EntriesController < ApplicationController

  def show
    # renders new entry
    @entries = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entries["place_id"]})
  end
  
  def new
    # renders new view connected to Place_ID
    @place = Place.find_by({ "id" => params["place_id"] })
   end 
  
  def create
    @entries=Entry.new

    # creates user-entered form data to Entry's columns, look at schema for data fields
    @entries["title"] = params["title"]
    @entries["posted_on"] = params["posted_on"] 
    @entries["description"] = params["description"]
    # create relationship between Entry and Places
    @entries["place_id"] = params["place_id"]
    #save
    @entries.save
    #redirect user 
    redirect_to "/places/#{@entries["place_id"]}"
  end 

end
