require 'rails_helper'

describe CpuUsed, type: :job do
  let(:cpu_used) { CpuUsed.new.perform }
  let(:save_register) { Cpu.find cpu_used.id }
  it { cpu_used.class == Cpu.new.class }
  it { cpu_used == save_register }
end