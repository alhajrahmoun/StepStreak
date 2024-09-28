class WebRequest < ApplicationRecord
  after_create_commit :ip_address_lookup

  def ip_address_lookup
    IpAddressLookupJob.perform_later(id)
  end
end
