class RegistrationController < Devise::RegistrationsController

  require 'mechanize'
  require 'geokit'
  require 'area'

	def create
    if request.referer.to_s.downcase.include? "vinny"
      campaign = request.referer.split('.com/').last
    else
      campaign = "other"
    end
    if params["user"]["age"]
      age = params["user"]["age"]
    end
    if params["user"]["zipcode"]
      zipcode = params["user"]["zipcode"]
    end
    if params["first_name"] && params["last_name"]
      name = params["first_name"] + " " + params["last_name"]
    end
    if params["user"]["address"]
      address = params["user"]["address"]
    end
    if params["user"]["city"]
      city = params["user"]["city"]
    end
    if params["user"]["state"]
      state = params["user"]["state"]
    end
    if params["user"]["electric"]
      electric = params["user"]["electric"]
    end
    if params["user"]["email"]
      email = params["user"]["email"]
    end
    if params["user"]["phone"]
      phone = params["user"]["phone"]
    end
    @user = User.create(:ip => request.remote_ip, :campaign => campaign, :zipcode => zipcode, :name => name, :address => address, :city => city, :state => state, :email => email, :phone => phone, :electric => electric)
      a = Mechanize.new
      if @user.campaign.to_s.downcase.include? "vinny"
        lead_src = "PUJ"
      elsif @user.campaign == "other"
        lead_src = "REV"
      else
        lead_src = "RAW"
      end
      url = "https://leads.leadtracksystem.com/genericPostlead.php"
      params = {
        "TYPE" => '89',
        "SRC" => "test",
        "Landing_Page" => "landing",
        "Lead_Type" => "Solar",
        "IP_Address" => @user.ip,
        "First_Name" => @user.name.split(' ')[0],
        "Last_Name" => @user.name.split(' ')[1],
        "Address" => @user.address,
        "City" => @user.city,
        "State" => @user.state,
        "Zip" => @user.zipcode,
        "Email" => @user.email,
        "Day_Phone" => @user.phone,
        "Evening_Phone" => @user.phone,
        "Age" => @user.age,
        "Employment_Status" => @user.employment,
        "Medical_Status" => @user.medical,
        "Representation_Status" => @user.attorney,
        "Unsecured Debt" => "No, I do not need help",
        "Student Loans" => "No, I do not need student debt help",
        "Description" => @user.desc,
        "Pub_ID" => lead_src
      }
      response = a.post(url, params)
      puts d = Nokogiri::XML(response.content)
      @user.lead = d.xpath("//lead_id").text
      @user.save!
    redirect_to "/logout"
  end
    

end
