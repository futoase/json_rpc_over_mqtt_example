require 'net/ping'

def ping(**kwargs)
  url = kwargs[:url] || "google.com"
  target = Net::Ping::External.new(url)
  result = target.ping? ? "OK" : "NG"
  "#{result}: #{url}"
end
