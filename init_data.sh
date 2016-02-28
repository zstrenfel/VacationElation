mongo launch_hack_development --eval "db.dropDatebase"
#mongoimport --jsonArray --drop -d launch_hack_development -c trips db/data/trip.json
mongoimport --jsonArray --drop -d launch_hack_development -c destinations db/data/destination.json
mongoimport --jsonArray --drop -d launch_hack_development -c users db/data/user.json

