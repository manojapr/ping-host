require 'bigdecimal/math'
require 'net/ping'

class StatusController < ApplicationController

  def index
      @status = Target.node_discovery()
      @up = @status.values.select{|x| x =="up"}.count
      @down = @status.values.select{|x| x =="down"}.count   
  end

end
