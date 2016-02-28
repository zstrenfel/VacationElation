json.user do 
	json.id @user.id
	json.name @user.name
	json.email @user.email
	json.gender @user.gender
	json.password @user.password
	json.trips do 
		json.array!(@trips) do |t|
			json.id t.id
		end
	end
end

