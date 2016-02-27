module TripsHelper
	def toDate string
		#date is a String in the format of "Thu Mar 03 2016 15:05:13 GMT+0000 (UTC)"
		#valid date format "Thu, 03 Mar 2016 15:05:13 GMT"
		array = string.split(" ");
		day = array[0] #Thu
		month = array[1] #Mar
		date = array[2] #03
		year = array[3] #2016
		time = array[4] #15:05:13
		format = "GMT"

		new_date = day + ", " + date + " " + month + " " + year + " " + time + " " + format
		Date.httpdate(new_date)
	end
end
