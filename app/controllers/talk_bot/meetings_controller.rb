require_dependency "talk_bot/application_controller"
module TalkBot
	class MeetingsController < ApplicationController
		before_action :set_meeting, only: [:show, :edit, :update, :destroy]


		def call
     # Rails.logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{params[:ph_no]}"
      
    default_client = "jenny"
     @client_name = params[:customer_name]
    if @client_name.nil?
        @client_name = default_client
    end
    @client_phone = params[:ph_no]
    # Find these values at twilio.com/user/account
    account_sid = 'AC1e7ff5d3ece16ab5ad2f63f7e201cb00'
    auth_token = 'cb902e68e940a3457383b6c813ab68f1'
    capability = Twilio::Util::Capability.new account_sid, auth_token
    # Create an application sid at twilio.com/user/account/apps and use it here
    capability.allow_client_outgoing "AP8270d0631a20c1edddf407e99299eca6"
    capability.allow_client_incoming @client_name
    @token = capability.generate
    end
    

		def voice
          default_client = "jenny"
          caller_id = "+13174268213"
          number = params[:PhoneNumber]
          response = Twilio::TwiML::Response.new do |r|
            # Should be your Twilio Number or a verified Caller ID
            r.Dial :callerId => caller_id do |d|
                # Test to see if the PhoneNumber is a number, or a Client ID. In
                # this case, we detect a Client ID by the presence of non-numbers
                # in the PhoneNumber parameter.
                if /^[\d\+\-\(\) ]+$/.match(number)
                    d.Number(CGI::escapeHTML number)
                else
                    d.Client default_client
                end
            end
        end
        render :text => response.text
  		end
    
    

# GET /meetings
def index
	@meetings = Meeting.all
end

# GET /meetings/1
def show
end

# GET /meetings/new
def new
	@meeting = Meeting.new
end

# GET /meetings/1/edit
def edit
end

# POST /meetings
def create
	@meeting = Meeting.new(meeting_params)

	if @meeting.save
		redirect_to @meeting, notice: 'Meeting was successfully created.'
	else
		render action: 'new'
	end
end

# PATCH/PUT /meetings/1
def update
	if @meeting.update(meeting_params)
		redirect_to @meeting, notice: 'Meeting was successfully updated.'
	else
		render action: 'edit'
	end
end

# DELETE /meetings/1
def destroy
	@meeting.destroy
	redirect_to meetings_url, notice: 'Meeting was successfully destroyed.'
end

private
# Use callbacks to share common setup or constraints between actions.
def set_meeting
	@meeting = Meeting.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def meeting_params
	params[:meeting]
end
	end
end
