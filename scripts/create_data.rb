Place.destroy_all
Entry.destroy_all

mx_city = Place.new
mx_city["name"] = "Mexico City"
mx_city.save

new_entry = Entry.new
new_entry["title"] = "Ate tacos"
new_entry["description"] = "Ate carnitas, steak, and veggie."
new_entry["posted_on"] = 2022-01-01
new_entry["place_id"] = mx_city["id"]
new_entry.save

puts "There are now #{Place.all.count} places and #{Entry.all.count} entries.

