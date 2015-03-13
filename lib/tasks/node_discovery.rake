# namespace :admin
#   task :node_discovery => :environment do
#     @target_controller = StatusController.new
#     @target_controller.index if status = Sidekiq::Status::status(@last_worker_id)
#   end
# end