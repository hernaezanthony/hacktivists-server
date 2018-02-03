class Api::PetitionController < ApplicationController

	#before_action :authenticate_user
	before_filter :cors_set_access_control_headers
	skip_before_filter :verify_authenticity_token

respond_to :json

	#headers['Access-Control-Allow-Origin'] = '*'
	#headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
	#headers['Access-Control-Request-Method'] = '*'
	#headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'


  	def cors_set_access_control_headers
    	response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    	response.headers['Access-Control-Allow-Origin'] = '*'
    	# response.headers['Origin'] = '*'
    	response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email'
    	response.headers['Access-Control-Max-Age'] = "1728000"
    	response.headers['X-XSS-Protection'] = "0"
  	end

    def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

	  def index 
		  petition = Petition.all
		  @http_response = petition
     	  @http_status = 200
      	  render :json => @http_response, :status => @http_status
    end

    def show
    	petition = Petition.all
        hash = {:petitions => petition }
		        @http_response = hash
     	        @http_status = 200
      	render :json => @http_response, :status => @http_status
    end

    def showReport
      petition = Petition.all
      hash = {:petitions => petition }
            @http_response = hash
            @http_status = 200
        render :json => @http_response, :status => @http_status
    end

    def create_petition
      	newpetition = Petition.new(petition_params)
      	if newpetition.save
      		#newenrollment = Enrollment.new(enrollment_params)
      		#petitionID = params [:user_id]
      		#if newenrollment.save
      		newpetition.update_attribute(:enrolled_students, 1)
      		#else
      		#	@http_response = {
            #          :result => "failed"
            #         }.to_json
        	#	@http_status = 400
      		#end

            @http_response = {
                      :result => "success",
                      :petition_id => newpetition.id
                      }.to_json
            @http_status = 200
            status = true
      	else
        		@http_response = {
                      :result => "failed"
                      }.to_json
        		@http_status = 400
            status = false
        end
          render :json => @http_response, :status => @http_status
    end

    def update_enrollment
    	newenrollment = Enrollment.new(enrollment_params)
    	petition = Petition.find_by(id: params[:petition_id])
    	petitionNum = petition.enrolled_students

    	if newenrollment.save
    		petition.update_attribute(:enrolled_students, petitionNum + 1)
            @http_response = {
                      :result => "success",
                      #:petition_id => newpetition.id
                      }.to_json
            @http_status = 200
            status = true
      	else
        		@http_response = {
                      :result => "failed"
                      }.to_json
        		@http_status = 400
            status = false
        end
          render :json => @http_response, :status => @http_status

    end

    def my_enrolled
    	enrolled = Enrollment.where(user_id: params[:user_id]).where(is_canceled: false)
    	if enrolled
				@http_response = enrolled
			else
				@http_response = {
                :result => "failed"
                }.to_json
            end
        render :json => @http_response
    end

    def cancel_enrolled
    	enrolled = Enrollment.find_by(id: params[:id])
    	if enrolled
    		enrolled.update_attribute(:is_canceled, true)
    		@http_response = {
                :result => "success"
                }.to_json
    	else
				@http_response = {
                :result => "failed"
                }.to_json
        end
        render :json => @http_response

    end

    def search
    	searchParam = params[:search]
    	searchPetition = Petition.where("lower(subject) LIKE lower(?)", "%#{searchParam}%")
    	if searchPetition
				@http_response = searchPetition
			else
				@http_response = {
                :result => "failed"
                }.to_json
            end
        render :json => @http_response

    end

    def posted
    	posted = Petition.find_by(id: params[:petition_id])
    		if posted 
    			posted.update_attribute(:is_posted, true)
    		@http_response = {
                :result => "success"
                }.to_json
        else
        	@http_response = {
                :result => "failed"
                }.to_json

        end
            render :json => @http_response
    end

    def updateID_freelancer
    	freelancer = Petition.find_by(id: params[:petition_id])
    	freelancerID = params[:freelancer_id]
    	if freelancer
    		freelancer.update_attribute(:freelancer_id, freelancerID)
    		@http_response = {
                :result => "success"
                }.to_json
        else
        	@http_response = {
                :result => "failed"
                }.to_json

        end
            render :json => @http_response
    end

    def updateTutor
    	pet = Petition.find_by(id: params[:petition_id])
    	fname = params[:tutor_name]

    	if pet
    		pet.update_attribute(:has_tutor, true)
    		pet.update_attribute(:tutor_fullname, fname)
    		@http_response = {
                :result => "success"
                }.to_json
        else
        	@http_response = {
                :result => "failed"
                }.to_json

        end
            render :json => @http_response

    end


private	

def petition_params
     params.permit(:user_id,:subject,:level, :location, :description, :minimum_price, :maximum_price)
end

def enrollment_params
	params.permit(:petition_id, :user_id)
end

end
