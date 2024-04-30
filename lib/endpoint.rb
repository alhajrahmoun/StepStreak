class Endpoint
  def self.root_url
    if Rails.env.production?
      'https://stepstreak.xyz/'
    else
      'http://192.168.0.89:3000'
    end
  end
end