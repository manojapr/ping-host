# class PrintWorker
#   include Sidekiq::Worker

#   def perform(id)
# 		host = Target.find(id)
#     ping_count = 1
# 		server = host.address
# 		result = `ping -s 1 -q -c #{ping_count} #{server}`
# 		$?.exitstatus == 0 ? host.statuses.create(status: "on") : host.statuses.create(status: "down")
# 	end

# end