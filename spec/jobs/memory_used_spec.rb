require 'rails_helper'

describe MemoryUsed, type: :job do
  let(:memory_used) { MemoryUsed.new.perform }
  let(:save_register) { Memory.find memory_used.id }
  it { memory_used.class == Memory.new.class }
  it { memory_used == save_register }
end