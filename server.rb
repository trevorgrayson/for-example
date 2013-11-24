require 'sinatra'
require 'open-uri'
require './lib/header_fix'

get '/*' do
  url = URI.parse(request.url)
  url.hostname = 'raw.github.com'
  url.scheme = 'https'
  url.port = 443
  s_url = URI.parse(url.to_s)

  headers = HeaderFix.headers_from_url(s_url.to_s)
  content_type headers['Content-Type']

  open(s_url) do |content|
    body = content.read.to_s
    return body.to_s
  end

end
