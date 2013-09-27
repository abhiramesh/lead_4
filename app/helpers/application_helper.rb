module ApplicationHelper

	def resource_name
		:user
    end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end


	def us_states
	  [
	    ['AK', 'AK'],
	    ['AL', 'AL'],
	    ['AR', 'AR'],
	    ['AZ', 'AZ'],
	    ['CA', 'CA'],
	    ['CO', 'CO'],
	    ['CT', 'CT'],
	    ['DC', 'DC'],
	    ['DE', 'DE'],
	    ['FL', 'FL'],
	    ['GA', 'GA'],
	    ['HI', 'HI'],
	    ['IA', 'IA'],
	    ['ID', 'ID'],
	    ['IL', 'IL'],
	    ['IN', 'IN'],
	    ['KS', 'KS'],
	    ['KY', 'KY'],
	    ['LA', 'LA'],
	    ['MA', 'MA'],
	    ['MD', 'MD'],
	    ['ME', 'ME'],
	    ['MI', 'MI'],
	    ['MN', 'MN'],
	    ['MO', 'MO'],
	    ['MS', 'MS'],
	    ['MT', 'MT'],
	    ['NC', 'NC'],
	    ['ND', 'ND'],
	    ['NE', 'NE'],
	    ['NH', 'NH'],
	    ['NJ', 'NJ'],
	    ['NM', 'NM'],
	    ['NV', 'NV'],
	    ['NY', 'NY'],
	    ['OH', 'OH'],
	    ['OK', 'OK'],
	    ['OR', 'OR'],
	    ['PA', 'PA'],
	    ['RI', 'RI'],
	    ['SC', 'SC'],
	    ['SD', 'SD'],
	    ['TN', 'TN'],
	    ['TX', 'TX'],
	    ['UT', 'UT'],
	    ['VA', 'VA'],
	    ['VT', 'VT'],
	    ['WA', 'WA'],
	    ['WI', 'WI'],
	    ['WV', 'WV'],
	    ['WY', 'WY']
	  ]
	end

	def best_time_to_contact
		[
			["Morning", "Morning"],
			["Afternoon", "Afternoon"],
			["Evening", "Evening"]
		]
	end

	def recieving_assistance
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end

	def monthly_average
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end

	def credit_history
		[
			["Excellent", "Excelent"],
			["Good", "Good"],
			["Fair", "Fair"],
			["Poor", "Poor"]
		]
	end

	def property_type
		[
			["Single Family Residence", "Single Family Residence"],
			["Condominium", "Condominium"],
			["Townhome", "Townhome"],
			["Duplex", "Duplex"],
			["Multi-Family Dwelling", "Multi-Family Dwelling"],
			["Unit", "Unit"]
		]
	end

	def property_status
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end

	def length_in_residence
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end

	def roof_adequate
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end

	def appointment
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end


end
