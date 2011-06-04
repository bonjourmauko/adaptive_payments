module AdaptivePayments
  
  REQUESTS = [
    # related to payments
    { :name => 'pay',                               :request_hash => true },
    { :name => 'payment_details',                   :request_hash => false },
    { :name => 'execute_payment',                   :request_hash => true },  # not sure
    { :name => 'get_payment_options',               :request_hash => true },  # not sure
    { :name => 'set_payment_options',               :request_hash => true },
    { :name => 'preapproval',                       :request_hash => true },
    # related to preapprovals                       
    { :name => 'preapproval',                       :request_hash => true },  #not sure
    { :name => 'preapproval_details',               :request_hash => false },
    { :name => 'cancel_preapproval',                :request_hash => false },
    { :name => 'confirm_preapproval',               :request_hash => false }, #not sure
    # others
    { :name => 'refund',                            :request_hash => false },
    { :name => 'convert_currency',                  :request_hash => false },
    { :name => 'get_funding_plans',                 :request_hash => false }, #not sure
    { :name => 'get_allowedfunding_sources',        :request_hash => false }, #not sure
    { :name => 'get_shipping_addresses',            :request_hash => false }, #not sure
    { :name => 'get_available_shipping_addresses',  :request_hash => false }  #not sure
  ] unless defined? REQUESTS
  
  COMMANDS = [
    { :name => 'payment',     :key_name => 'payKey' },
    { :name => 'preapproval', :key_name => 'preapprovalKey' }
  ] unless defined? COMMANDS
  
  BASE_MAPPINGS = [
    'api', 
    'paypal'
  ] unless defined? BASE_MAPPINGS

end