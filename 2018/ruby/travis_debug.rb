LivingSocial::Payments.credit_card_exists?(96293565, 33130013, :payment_method => :paypass, api_client_params: {client_name: "csr_tool"})



LivingSocial::Payments.credit_card_exists?(person.id, purchase.credit_card_id, :payment_method => :paypass, client_name: 'csr_tool', api_client_params: {client_name: "csr_tool"})

LivingSocial::Payments.credit_card_exists?(person_id, cc_id, {:payment_method => :paypass, client_name: 'csr_tool'})

def self.credit_card_exists?(person_id, card_id, options = {})
  default_versions = { :paypass => :v1 }
  raise ResourceNotFoundError, "nil person_id or card_id is not allowed" if person_id.nil? or card_id.nil?
  method = payment_method({:payment_method => :paypass, client_name: 'csr_tool'}) # > :paypass
  raise ArgumentError, "#{method.inspect} payment method not supported" unless [:paypass].include?(method)

  options[:version] ||= default_versions[:paypass] # => :v1

  {:payment_method => :paypass, client_name: 'csr_tool', version: :v1}

  handle_response(client(:v1, :paypass).get("/people/#{person_id}/credit_cards/#{card_id}/exists", options[:api_client_params] || {}, options[:api_client_headers] || {}), 200) do |response|
    response.parsed_response.credit_card_exists?
  end
end

def self.payment_service_client({:payment_method => :paypass, client_name: 'csr_tool', version: :v1})
  application = :paypass
  unless SUPPORTED_PAYMENT_METHODS.include?(:paypass) # => true
    raise "#{application} is not supported!"
  end
  LS::ApiClient.new(:paypass, :v1).tap do |client|
    client.middleware.unshift FaradayMiddleware::Mashify
  end
end

def self.version({:payment_method => :paypass, client_name: 'csr_tool', version: :v1})
  (options[:version] || :v1).to_sym
end

def self.payment_method({:payment_method => :paypass, client_name: 'csr_tool'})
  (:paypass).to_sym
end

# get request with LS Api Client path and params
("/people/#{person_id}/credit_cards/#{card_id}/exists", options[:api_client_params] || {}, options[:api_client_headers] || {})