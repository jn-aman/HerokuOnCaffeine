class Report < ApplicationRecord

def self.sendReport
@email = Report.distinct.pluck(:email)
@email.each do |e|
@l="https://www.herokuoncaffeine.in/websites/getgraph/"+e.to_s
#`export DISPLAY=":0.0"`

`vncserver ;export DISPLAY=":0.0";python -m webbrowser  #{@l} ;  killall -9 chrome ; vncserver -kill :1`

NofitymailMailer.status(e).deliver_now

end
@email.each do |e|
@k=Report.where("email = ?",e).last.id.to_s+".png"
`cd ~;cd Downloads ; rm #{@k}`

end

end

end
