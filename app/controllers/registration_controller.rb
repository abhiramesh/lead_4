class RegistrationController < Devise::RegistrationsController


	def create
    if request.referer.to_s.downcase.include? "vinny"
      campaign = request.referer.split('.com/').last
    else
      campaign = "other"
    end
    if params["user"] && params["user"]["age"]
      age = params["user"]["age"]
    end
    if params["user"] && params["user"]["zipcode"]
      zipcode = params["user"]["zipcode"]
    end
    if params["first_name"] && params["last_name"]
      name = params["first_name"] + " " + params["last_name"]
    end
    if params["user"] && params["user"]["address"]
      address = params["user"]["address"]
    end
    if params["user"] && params["user"]["city"]
      city = params["user"]["city"]
    end
    if params["user"] && params["user"]["state"]
      state = params["user"]["state"]
    end
    if params["user"] && params["user"]["electric"]
      electric = params["user"]["electric"]
    end
    if params["user"] && params["user"]["email"]
      email = params["user"]["email"]
    end
    if params["user"] && params["user"]["phone"]
      phone = params["user"]["phone"]
    end
    @user = User.create(:ip => request.remote_ip, :campaign => campaign, :zipcode => zipcode, :name => name, :address => address, :city => city, :state => state, :email => email, :phone => phone, :electric => electric)
    sign_in @user
  end
    

end
