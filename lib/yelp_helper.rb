require 'net/http'
require 'json'

module YelpHelper

  # PARAMS= term: what gets typed in search bar, lat+long: location (other location options available), limit: max entries to return
  # returns array of business names
  def request(term, latitude, longitude, limit = 10)
    url = URI.parse("https://api.yelp.com/v2/search?term=#{term}&cll=#{latitude},#{longitude}&limit=#{limit}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
    json = JSON.parse(res)

    businesses = json['businesses']
    names = []
    businesses.each do |business|
      names.push(business['name'])
    end

    names
  end

end