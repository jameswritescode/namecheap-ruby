module Namecheap::Domain
  include Namecheap::API
  extend self

  def check(domains)
    domains = domains.is_a?(Array) ? domains.join(',') : domains

    get 'domains.check', DomainList: domains
  end

  def create(*)
    raise 'implementation needed'
  end

  def get_contacts(domain)
    get 'domains.getContacts', DomainName: domain
  end

  def get_info(domain)
    get 'domains.getInfo', DomainName: domain
  end

  def get_list
    get 'domains.getList'
  end

  def get_registrar_lock(domain)
    get 'domains.getRegistrarLock', DomainName: domain
  end

  def get_tld_list
    get 'domains.getTldList'
  end

  def reactivate(domain)
    get 'domains.reactivate', DomainName: domain
  end

  def renew(domain, years = 1, promo_code = nil)
    params = { DomainName: domain, Years: years }
    params.merge!(PromotionCode: promo_code) unless promo_code.nil?

    get 'domains.renew', params
  end

  def set_contacts(*)
    raise 'implementation needed'
  end

  def set_registrar_lock(domain, lock)
    raise "Lock value must be 'LOCK' or 'UNLOCK'" unless lock == 'LOCK' || lock == 'UNLOCK'

    params = { DomainName: domain, LockAction: lock }

    get 'domains.setRegistrarLock', params
  end
end
