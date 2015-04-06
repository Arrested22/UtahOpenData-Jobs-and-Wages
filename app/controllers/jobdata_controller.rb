class JobdataController < ApplicationController
  def index
    uri = URI.parse("https://opendata.utah.gov/resource/88ws-42u9.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    @jobwages = ActiveSupport::JSON.decode(response.body)
    p @jobwages
  end

  def computer
    csjobs = ['15-0000','15-1111','15-1121','15-1122','15-1131','15-1132','15-1133','15-1134','15-1141','15-1142','15-1143','15-1151','15-1152','15-1199']
    @csjobsarray = []
    csjobs.each do |job|
      # jobjson = curl https://opendata.utah.gov/resource/88ws-42u9.json?$where=occupation_code = '15-0000'

      uri = URI.parse("https://opendata.utah.gov/resource/88ws-42u9.json?$where=occupation_code = '#{job}'")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      jobjson = response.body 

      @csjobsarray << jobjson
    end
    p @csjobsarray
  end

  def show
  end
end
