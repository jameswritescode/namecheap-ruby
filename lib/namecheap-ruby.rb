require 'httparty'

require 'namecheap/version'
require 'namecheap/configuration'
require 'namecheap/api'
require 'namecheap/resources/domain'

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
