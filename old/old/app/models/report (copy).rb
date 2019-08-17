class Report < ApplicationRecord

def self.sendReport
@email = Report.distinct.pluck(:email)
@email.each do |e|
@l="https://www.herokuoncaffeine.in/websites/getgraph/"+e.to_s

`python -m webbrowser  #{@l} ;  killall -9 chrome`

NofitymailMailer.status(e).deliver_now

end
@email.each do |e|
@k=Report.where("email = ?",e).last.id.to_s+".png"
`cd ~;cd Downloads ; rm #{@k}`

end

end

end
