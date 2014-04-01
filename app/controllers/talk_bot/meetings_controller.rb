require_dependency "talk_bot/application_controller"
module TalkBot
	class MeetingsController < ApplicationController
		before_action :set_meeting, only: [:show, :edit, :update, :destroy]


		def call
			default_client = "aravind"
			@client_name = params[:client]
			Rails.logger.info "Initial client name"
			Rails.logger.info @client_name
			if @client_name.nil?
				@client_name = default_client
			end
			Rails.logger.info "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			Rails.logger.info @client_name
			TWILIO_INIT.allow_client_outgoing DEMO_APP_SID_TWILIO
			TWILIO_INIT.allow_client_incoming @client_name
			@token = TWILIO_INIT.generate
			Rails.logger.info "Client name:!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			Rails.logger.info @client_name
			Rails.logger.info "TOKEN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			Rails.logger.info @token
		end

		def voice
			caller_id = "+15162848057"
			number = params[:PhoneNumber]
			response = Twilio::TwiML::Response.new do |r|
				# Should be your Twilio Number or a verified Caller ID
				r.Dial :callerId => caller_id do |d|
					# # Test to see if the PhoneNumber is a number, or a Client ID. In
					# # this case, we detect a Client ID by the presence of non-numbers
					# # in the PhoneNumber parameter.
					if /^[\d\+\-\(\) ]+$/.match(number)
						d.Number(CGI::escapeHTML number)
					else
						d.Client number
					end
				end
			end
			render :text=> response.text
			Rails.logger.info response.text
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
