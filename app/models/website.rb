class Website < ApplicationRecord

def self.looping
require 'open-uri'

Website.all.each do |p|
 	if p.url
  		k=p.url+'/'
  		url = URI.parse(p.url)
  		# `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`
	  	open(url) do |f|
			@response=f.status
		end
p.updated_at=Time.now
p.code=@response[0]
p.save
		if @response[0]!='200'

			Thread.new do
			NofitymailMailer.error(p,@response).deliver_now
			end
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


#Thread.new do
#NofitymailMailer.error(@w,response).deliver_now
#end






end
