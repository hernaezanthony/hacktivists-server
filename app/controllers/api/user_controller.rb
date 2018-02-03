class Api::UserController < ApplicationController

skip_before_filter :verify_authenticity_token

	respond_to :json

    def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

	def index 
		user = User.all
		@http_response = user
     	@http_status = 200
      	render :json => @http_response, :status => @http_status
    end
    
    def show
      user = User.all
      @http_response = user
      @http_status = 200
      render :json => @http_response, :status => @http_status
    end	

   	def register
      	user = User.new(user_params)
      	if user.save
            @http_response = user
            @http_status = 200
            status = true
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
            status = false
        end
          render :json => @http_response, :status => @http_status  
    end


    def login
       user = User.find_for_database_authentication(:email => params[:email])
          if user
              if user.valid_password?(params[:password])
                  @status = true 
                  #access_token(user) 
                  @http_response = {
                    :result => "success",
                    :message => "Welcome!",
                    :user_id => user.id,
                    :firstname => user.first_name,
                    :last_name => user.last_name,
                    :fullname => user.first_name + " " + user.last_name,
                    :email => user.email,
                    #:token => user.token
                    }.to_json
                  @http_status = 200  
              else
                  @http_response = {
                    :result => "failed",
                    :message => "Incorrect Password!"
                    }.to_json
                  @status = false
              end
          else
            @http_response = {
              :result => "failed",
              :message => " Invalid Email!"
              }.to_json
          end
        render :json => @http_response, :status => @http_status
    end

    
    def logout
          user = User.find_by(token: params[:token])
          if temp = user.token
            user.update_attribute(:token, nil) #clear token
              @http_response = {
              :result => "success",
              :message => "Logged-out! !"
              }.to_json
          else
            @http_response = {
              :result => "failed",
              :message => "Try Again!"
              }.to_json
          end   
            render :json => @http_response
    end

    def access_token(user)
        token = SecureRandom.hex(8)
        user.update_attribute(:token, token)
    end
 

private


  def user_params
     params.permit(:email,:first_name,:last_name, :password, :password_confirmation)
  end

end

