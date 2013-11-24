require 'header_fix'

describe HeaderFix do
  context "content type" do
    let(:url) { "http://example.com/some/dir/awesome.%s?p1=1&p2=two" }
    
    it "for common extensions" do
      [:css, :html].each do |ext|
        headers = HeaderFix.headers_from_url( url_with_ext(ext) )
        headers['Content-Type'].should == "text/#{ext}"
      end
    end

    it "javascript is special" do
      headers = HeaderFix.headers_from_url( url_with_ext(:js) )
      headers['Content-Type'].should == "application/javascript"
    end

    it "defaults to text/:extension" do
      headers = HeaderFix.headers_from_url( url_with_ext(:garbage) )
      headers['Content-Type'].should == "text/#{:garbage}"
    end

    def url_with_ext(ext)
      url % ext
    end
  end
end
