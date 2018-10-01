class MemoryUsed
  include Sidekiq::Worker
  sidekiq_options queue: :memory_used
  sidekiq_options retry: false
  
  def perform
    parts = `free`.split("\n")
    memories = []
    mem = []
    for i in (1..parts.size-1) do
      memories << parts[i].split(" ").map { |s| s.to_i }
    end
    Memory.create(memory: 0, total: memories[0][1], used: memories[0][2], free: memories[0][6])
    Memory.create(memory: 1, total: memories[1][1], used: memories[1][2], free: memories[1][3])
  end
end