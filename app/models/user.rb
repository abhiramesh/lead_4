class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :zipcode, :home_value, :mortgage_balance, :name, :email, :phone, :age, :employment, :attorney, :medical, :lead, :ip, :campaign, :desc, :qualified, :loan, :debt, :address, :city, :state, :electric, :appointment, :time_zone, :best_time, :assist, :credit, :type, :status, :length, :roof

end
