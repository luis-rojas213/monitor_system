class DiskUsed
  include Sidekiq::Worker
  sidekiq_options queue: :disk_used
  sidekiq_options retry: false
  
  def perform
    df = `df /`
    parts = df.split(" ").map { |s| s.to_i }
    Disk.create(total: parts[10], used: parts[11], free: parts[12], percentage: parts[13])
  end
end