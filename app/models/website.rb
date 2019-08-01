class Website < ApplicationRecord

def self.looping

require 'open-uri'
Website.all.each do |p|
  if p.url
  	k=p.url+'/'
  url = URI.parse(p.url)
  # `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`
  open(url)
end
  
end


end


def rectify
	k="https://"
@test_string= self.url
if @test_string.include? "http://www."
   @test_string.slice! "http://www."
   @test_string = k+@test_string


elsif  @test_string.include? "http://"
   @test_string.slice! "http://"
   @test_string=k+@test_string




elsif @test_string.include? "www."
   @test_string.slice! "www."
@test_string = k+@test_string

else
	@test_string = k+@test_string

end

self.url=@test_string
end


end
