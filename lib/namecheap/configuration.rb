class Namecheap::Configuration
  attr_reader :options

  REQUIRED_PARAMS = [:user, :api_key, :ip]

  def initialize(opts = {})
    raise "Missing configuration options: #{REQUIRED_PARAMS.delete_if { |param| opts.has_key?(param) }.join(', ')}" unless validate_config(opts)

    @options = opts
    @options[:sandbox] ||= false
    @options
  end

  private

  def validate_config(opts)
    REQUIRED_PARAMS.delete_if { |param| opts.has_key?(param) }.count.zero?
  end
end
