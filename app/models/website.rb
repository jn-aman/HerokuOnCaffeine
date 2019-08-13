class Website < ApplicationRecord

def self.looping
require 'net/http'
@response=[]
Website.all.each do |p|
 	if p.url
  	response=[]	
	k=p.url+'/'
  		url = URI(k)
  		# `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`
response1 = Net::HTTP.get_response(url)
response.push(response1.code)
response.push(response1.message)
p.updated_at=Time.now
p.code=response[0]
p.save
report=Report.new
report.email=p.email
report.url=p.url
report.code=response[0]
report.error=response[1]
if p.code=="200"
report.up=1
else
report.up=0
end
report.save

@response=response	
	if @response[0]!='200'
			NofitymailMailer.error(p,@response).deliver_now
			
		end
	
	end
  	
#loop
end

#function
end


















def rectify
	k="https://"
@test_string= self.url
if @test_string["http://www."]
   @test_string.slice! "http://www."
   @test_string = k+@test_string

elsif @test_string["https://www."]
@test_string.slice! "https://www."
@test_string = k+@test_string

elsif  @test_string["http://"]
   @test_string.slice! "http://"
   @test_string=k+@test_string

elsif @test_string["https://"]


elsif @test_string["www."]
   @test_string.slice! "www."
@test_string = k+@test_string


else
	@test_string = k+@test_string

end

self.url=@test_string
end








end
