require 'rails_helper'

describe CpuUsed, type: :job do
  let(:cpu_used) { CpuUsed.new.perform }
  it { cpu_used.class == Cpu.new.class }
end