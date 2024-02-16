class EntriesController < ApplicationController

  def show
    # renders new entry
    @place = Place.find_by({"id" => params["id"]})
    @entries= Entry.find_by({"id" => @entries["place_id"]})
  end
  
  def new
    # shows new entry
    @entries = Entry.new
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
