class Push
	def self.send(target, title, additionalInfo)
		body = {
			sentType: "userIDs",
			mimeType: "text/plain",
			OSTypes: ["Android"],
			notificationMessage: title,
			androidData: {
				title: title
			},
			additionalInfo: additionalInfo,
			userIDs: [ target ]
		}

		response = HTTParty.post("#{ENV['push_api_url']}#{ENV['push_application_id']}/message", 
			body: body.to_json,
			basic_auth: {
				username: ENV['push_username'],
				password: ENV['push_password']
			},
			headers: {
				"Content-type" => "application/json" 
			},
			debug_output: $stdout)
		response.code == 200
	end
end