module Namecheap::DNS
  include Namecheap::API
  extend self

  def get_email_forwarding(domain)
    get 'domains.dns.getEmailForwarding', DomainName: domain
  end

  def get_hosts(domain)
    get 'domains.dns.getHosts', split_domain(domain)
  end

  def get_list(domain)
    get 'domains.dns.getList', split_domain(domain)
  end

  def set_custom(domain, nameservers)
    nameservers = nameservers.is_a?(Array) ? nameservers.join(',') : nameservers

    get 'domains.dns.setCustom', split_domain(domain).merge(Nameservers: nameservers)
  end

  def set_default(domain)
    get 'domains.dns.setDefault', split_domain(domain)
  end

  def set_email_forwarding(domain, mailboxes)
    get 'domains.dns.setEmailForwarding', { DomainName: domain }.merge(format_mailboxes(mailboxes))
  end

  def set_hosts(domain, hosts)
    get 'domains.dns.setHosts', split_domain(domain).merge(format_hosts(hosts))
  end

  private

  def format_hosts(hosts)
    hosts       = hosts.is_a?(Array) ? hosts : [hosts]
    host_params = {}

    hosts.each_with_index do |hash, index|
      i                             = index + 1
      host_params["HostName#{i}"]   = hash[:hostname]
      host_params["RecordType#{i}"] = hash[:type]
      host_params["Address#{i}"]    = hash[:address]
      host_params["MXPref#{i}"]     = hash[:mx_pref] if hash[:type] == 'MX'
      host_params["EmailType#{i}"]  = hash[:email_type] if hash[:email_type]
      host_params["TTL#{i}"]        = hash[:ttl] if hash[:ttl]
    end
  end

  def format_mailboxes(mailboxes)
    mailboxes  = mailboxes.is_a?(Array) ? mailboxes : [mailboxes]
    box_params = {}

    mailboxes.each_with_index do |hash, index|
      i                                  = index + 1
      box_params["MailBox#{i}".to_sym]   = hash[:mailbox]
      box_params["ForwardTo#{i}".to_sym] = hash[:forward_to]
    end
  end

  def split_domain(domain)
    tld, sld = domain.split('.')

    { TLD: tld, SLD: sld }
  end
end
