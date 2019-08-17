# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

# Example:
#
set :output, "cron_log.log"
#
every 5.minutes do
runner "Website.looping"
end

every 1.day, at: '4:30 am' do
  runner "Report.sendReport"
end




#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
