class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :results, :checkzip, :update]

  require 'mechanize'
  require 'geokit'
  require 'area'

  # GET /users
  # GET /users.json
  def index
    @users = User.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def extra_info
    if current_user
      @user = current_user
    end
  end

  def results
    @users = User.all.sort
  end

  def checkzip
    if params["zipcode"].length == 5 && params["zipcode"].to_region != nil
      render json: "yes".to_json
    else
      render json: "no".to_json
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if params["assistance"]
      @user.assist = params["assistance"]
      @user.save!
    end
    if params["credit"]
      @user.credit = params["credit"]
      @user.save!
    end
    if params["type"]
      @user.proptype = params["type"]
      @user.save!
    end
    if params["roof"]
      @user.roof = params["roof"]
      @user.save!
    end
    if params["status"]
      @user.status = params["status"]
      @user.save!
    end
    if params["user"] && params["user"]["appointment"]
      @user.appointment = params["user"]["appointment"]
      @user.save!
    end
    if params["user"] && params["user"]["time_zone"]
      @user.time_zone = params["user"]["time_zone"]
      @user.save!
    end
    if @user.appointment
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
        "SRC" => "pujsolar",
        "Landing_Page" => "pujsolar",
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
        "Appointment_Date_Time" => @user.appointment,
        "Time_Zone" => @user.time_zone,
        "Receiving_Assistance" => @user.assist,
        "Monthly_Average" => @user.electric,
        "Credit_History" => @user.credit,
        "Property_Type" => @user.proptype,
        "Property_Status" => @user.status,
        "Roof_Adequate" => @user.roof,
        "Length_In_Residence" => "Yes",
        "Pub_ID" => "123",
        "Sub_ID" => "123",

      }
      response = a.post(url, params)
      puts d = Nokogiri::XML(response.content)
      @user.lead = d.xpath("//lead_id").text
      @user.save!
    redirect_to "/logout"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
