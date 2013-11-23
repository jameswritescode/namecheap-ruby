module Namecheap::API
  SANDBOX    = 'https://api.sandbox.namecheap.com/xml.response'
  PRODUCTION = 'https://api.namecheap.com/xml.response'

  def get(command, options = {})
    request :get, command, options
  end

  def post(command, options = {})
    request :post, command, options
  end

  private

  def base_uri
    Namecheap.config[:sandbox] ? SANDBOX : PRODUCTION
  end

  def request(type, command, options = {})
    endpoint = "#{params(options)}&Command=namecheap.#{command}"

    HTTParty.send(type, "#{base_uri}#{endpoint}")
  end

  def params(options = {})
    params = ''

    {
      ApiUser:  Namecheap.config[:user],
      ApiKey:   Namecheap.config[:api_key],
      ClientIp: Namecheap.config[:ip],
      UserName: Namecheap.config[:user]
    }.merge(options).each do |key, value|
      params += "&#{key}=#{value}"
    end

    params.gsub(/^&/, '?')
  end
end
