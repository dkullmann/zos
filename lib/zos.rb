require 'savon'

class ZOS

	def initialize(k, p, c)

		@uri_template = 'http://api-qa.zoscomm.com/1/%s/service.svc?wsdl';

		@auth = {:apiKey => k, :apiPasswd => p, :clientId => c}

		@namespaces = {
			'xmlns:tns' => 'http://tempuri.org/',
			'xmlns:soapenv' => 'http://schemas.xmlsoap.org/soap/envelope/',
			'xmlns:wcf' => 'http://schemas.datacontract.org/2004/07/WcfDevice.ZOS.API.Device'
		}

		Savon.configure do |config|
			config.pretty_print_xml = true
			config.env_namespace = :soapenv
		end

	end

	def generate_client(endpoint)
		Savon.client(sprintf(@uri_template, endpoint))
	end

	def add_landmark(options={})

		endpoint = 'event'

		client = generate_client(endpoint)

		defaults = {}

		options = @auth.merge(defaults).merge(options)

		namespaces = @namespaces

		response = client.request :tns, :add_landmark do
			soap.xml do |xml|
			 	xml.soapenv(:Envelope, namespaces) do |xml|
			    	xml.soapenv(:Body) do |xml|
			    		xml.tns(:addLandmark) do |xml|
							xml.tns(:pAddLandmarkInput) do |xml|
								options.each do |k, v|
									xml.wcf(k, v)
								end
							end
						end
			    	end
				end
			end
		end

		response = response.to_hash

		if response[:add_landmark_response][:add_landmark_result][:return_code] == '0' then
			raise "Unable to create landmark"
		end

		response[:add_landmark_response][:add_landmark_result][:landmark_id]
	end

	def get_device_tree(options={})

		endpoint = 'device'

		defaults = {
			:includeDevices => 1,
			:searchDirection => 'Down',
			:searchLevel => -1,
			:searchTerm => 'TOPGROUP',
			:searchType => 'GroupId'
		}

		client = generate_client(endpoint)

		options = @auth.merge(defaults).merge(options)

		namespaces = @namespaces

		client.request :tns, :get_device_tree do
			soap.xml do |xml|
			 	xml.soapenv(:Envelope, namespaces) do |xml|
			    	xml.soapenv(:Body) do |xml|
			    		xml.tns(:getDeviceTree) do |xml|
							xml.tns(:pGetDeviceTree) do |xml|
								options.each do |k, v|
									xml.wcf(k, v)
								end
							end
						end
			    	end
				end
			end
		end
	end
end