#Parallel Payment Example
Inspired from tc's *paypal_adaptive* https://github.com/tc/paypal_adaptive 

*config/paypal.yml*

```yml
credentials:
  production:
    username:       
    password:       
    signature:      
    application_id: 
  development:
    username:       
    password:       
    signature:      
    application_id: 
    
base_url_mapping:
  paypal:
    production:     "https://www.paypal.com"
    development:    "https://www.sandbox.paypal.com"
  api:
    production:     "https://svcs.paypal.com"
    development:    "https://svcs.sandbox.paypal.com"
```

    
*lib/test_app.rb*

```ruby
class TestApp < ActionController::Metal
  include ActionController::Rendering
  include ActionController::Redirecting
  append_view_path "#{Rails.root}/app/views"
  
  def index
    render
  end
  
  def buy
    request = AdaptivePayments::Transaction.new

    data = {
      "returnUrl" => "example.com/download", 
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"USD",  
      "receiverList"=>{"receiver"=>[
          {"email"=>"email@email.com", "amount"=>"10.00"},
          {"email"=>"another_email@email.com", "amount"=>"5.00"}
        ]},
      "cancelUrl"=>"example.com/canceled",
      "actionType"=>"PAY"    
    }

    request.pay(data)
    
    if request.success?
      redirect_to request.payment_url
    else
      raise "#{request.errors}"
    end
  end
  
  def download
    render
  end
end
```