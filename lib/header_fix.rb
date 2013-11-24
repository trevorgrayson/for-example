class HeaderFix
  class << self
    TYPE_MAP = {
      'js'  => "application/javascript"
    }

    def headers_from_url url
      ext = File.extname(url).gsub(/\?.*/,'')
      ext[0] = ''

      {
        'Content-Type' => TYPE_MAP[ext] || "text/#{ext}"
      }
    end
  end
end
