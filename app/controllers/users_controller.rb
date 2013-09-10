class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :edit, :update, :results]

  require 'mechanize'

  # GET /users
  # GET /users.json
  def index
    @users = User.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def results
    @users = User.all.sort
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
    if params["age"]
      @user.age = params["age"]
      @user.save!
    end
    if params["employment"]
      @user.employment = params["employment"]
      @user.save!
    end
    if params["medical"]
      @user.medical = params["medical"]
      @user.save!
    end
    if params["attorney"]
      @user.attorney = params["attorney"]
      @user.save!
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/logout' }
        format.json { head :no_content }
        format.js { redirect_to '/logout'}
        if @user.email != nil
      #    a = Mechanize.new
       #   url = "https://leads.leadtracksystem.com/genericPostlead.php"
        #  params = {
         #   "TYPE" => '85',
          #  "SRC" => "PujiiTestSite",
          #  "Landing_Page" => "amp1",
           # "IP_Address" => "75.2.92.149",
#            "First_Name" => @user.name.split(' ')[0],
 #           "Last_Name" => @user.name.split(' ')[1],
  #          "State" => "PA",
   #         "Zip" => @user.zipcode,
#            "Email" => @user.email,
 #           "Day_Phone" => @user.phone,
  #          "Age" => @user.age,
   #         "Employment_Status" => @user.employment,
    #        "Medical_Status" => @user.medical,
     #       "Representation_Status" => @user.attorney,
      #      "Unsecured Debt" => "Yes, I need debt help",
       #     "Student Loans" => "Yes, I need student debt help"
        #  }
         # response = a.post(url, params)
#          d = Nokogiri::XML(response.content)
 #         @user.lead = d.xpath("//lead_id").text
  #        @user.save!
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
