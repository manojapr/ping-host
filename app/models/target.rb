require 'sidekiq'
# require 'sidekiq-status'
class Target < ActiveRecord::Base
  belongs_to :appliance

  validates :appliance_id, presence:   true

  validates :hostname,     presence:   true,
                           uniqueness: true

  validates :address,      presence:   true,
                           format:     {with: Resolv::IPv4::Regex}

	 def self.node_discovery()
	 	@hosts = Target.first(50)
    result = Hash.new
    work_q = Queue.new
      @hosts.each{|x| work_q.push x }
      workers = (0...2000).map do
           Thread.new do
                begin
                     while host = work_q.pop(true)
                        ping_count = 1
                        server = host.address
                        if  Net::Ping::TCP.new(server, 'http').ping?
                             result[host.hostname] =  "up"
                        else
                             result[host.hostname] = "down"
                        end
                     end
                rescue ThreadError
                end
           end
      end;
      
      workers.map(&:join)
      return result

	 end
	 



end
