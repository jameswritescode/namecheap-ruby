require 'httparty'

require 'namecheap/version'
require 'namecheap/configuration'
require 'namecheap/api'
require 'namecheap/resources/domain'
require 'namecheap/resources/dns'

module Namecheap
  class << self
    def config
      @config
    end

    def configure(opts = {})
      @config = Namecheap::Configuration.new(opts).options
    end
  end
end
