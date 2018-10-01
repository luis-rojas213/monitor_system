class MonitoringController < ApplicationController
  def index
    params[:fecha] ||= Time.now.strftime("%Y-%m-%d / %H")
    @disk = Disk.where("date_format(created_at,'%Y-%m-%d %H') = '#{params[:fecha]}'").first
    @memory = Memory.where("date_format(created_at,'%Y-%m-%d %H') = '#{params[:fecha]}'")
    @cpu = Cpu.where("date_format(created_at,'%Y-%m-%d %H') = '#{params[:fecha]}'")
  end

end
