class CpuUsed
  include Sidekiq::Worker
  sidekiq_options queue: :cpu_used
  sidekiq_options retry: false
  
  def perform
    cpu0 = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")
    sleep 1
    cpu1 = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")

    cpu0usagesum = cpu0[1].to_i + cpu0[2].to_i + cpu0[3].to_i
    cpu1usagesum = cpu1[1].to_i + cpu1[2].to_i + cpu1[3].to_i
    usage = cpu1usagesum - cpu0usagesum

    cpu0total = 0
    for i in (1..4) do
      cpu0total += cpu0[i].to_i
    end
    cpu1total = 0
    for i in (1..4) do
      cpu1total += cpu1[i].to_i
    end
    cputotal = (cpu1total - cpu0total)

    cpuusage = (usage.to_f / cputotal.to_f)
    cpuusagepercentage = (100 * cpuusage).to_f.round(2)
    Cpu.create(used: usage, total: cputotal, percentage: cpuusagepercentage)
  end
end