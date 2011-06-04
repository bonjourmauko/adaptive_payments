module AdaptivePayments
  class Base
    attr_accessor :credentials,
                  :headers,
                  :paypal_base_url,
                  :api_base_url
    
    def initialize
      settings      = self.load File.join(Rails.root, 'config', 'paypal.yml')
      @env          = Rails.env
      @credentials  = settings['credentials'][@env]
      
      BASE_MAPPINGS.each { |name| instance_variable_set("@#{name}_base_url", eval("settings['base_url_mapping']['#{name}'][@env]")) }
        
      @headers = {
        "X-PAYPAL-SECURITY-USERID"      => @credentials['username'],
        "X-PAYPAL-SECURITY-PASSWORD"    => @credentials['password'],
        "X-PAYPAL-SECURITY-SIGNATURE"   => @credentials['signature'],
        "X-PAYPAL-APPLICATION-ID"       => @credentials['application_id'],
        "X-PAYPAL-REQUEST-DATA-FORMAT"  => "JSON",
        "X-PAYPAL-RESPONSE-DATA-FORMAT" => "JSON"
      }
    end
    
    def load(file)
      YAML.load_file file
    end
  end
end