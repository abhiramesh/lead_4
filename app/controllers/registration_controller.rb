class RegistrationController < Devise::RegistrationsController

	def create
    if request.referer.to_s.downcase.include? "vinny"
      campaign = request.referer.split('.com/').last
    else
      campaign = "other"
    end
    if params["user"]["phone"]
      phone = params["user"]["phone"]
    end
    if params["user"]["email"]
      email = params["user"]["email"]
    end
    if params["user"]["zipcode"]
      zipcode = params["user"]["zipcode"]
    end
    if params["first_name"] && params["last_name"]
      name = params["first_name"] + " " + params["last_name"]
    end

    @user = User.create(:ip => request.remote_ip, :campaign => campaign, :phone => phone, :email => email, :name => name, :zipcode => zipcode)
    sign_in @user
  end
    

end
