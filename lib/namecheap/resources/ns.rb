module Namecheap::NS
  include Namecheap::API
  extend self

  def create(domain, nameserver, ip)
    get 'domains.ns.create', split_domain(domain).merge(Nameserver: nameserver, IP: ip)
  end

  def delete(domain, nameserver)
    get 'domains.ns.delete', split_domain(domain).merge(Nameserver: nameserver)
  end

  def get_info(domain, nameserver)
    get 'domains.ns.getInfo', split_domain(domain).merge(Nameserver: nameserver)
  end

  def update(domain, nameserver, ip)
    old_ip = get_info(domain, nameserver).parsed_response['ApiResponse']['CommandResponse']['DomainNSInfoResult']['IP']

    get 'domains.ns.update', split_domain(domain).merge(Nameserver: nameserver, OldIP: old_ip, IP: ip)
  end

  private

  def split_domain(domain)
    sld, tld = domain.split('.')

    { SLD: sld, TLD: tld }
  end
end
