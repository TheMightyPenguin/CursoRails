module PeopleHelper
	def show_profile(person)
		if person.profile.nil?
		link_to "Agregar Profile", add_profile_person_path(@person)
		end
	end
end
