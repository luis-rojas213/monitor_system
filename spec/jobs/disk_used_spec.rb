require 'rails_helper'

describe DiskUsed, type: :job do
  let(:disk_used) { DiskUsed.new.perform }
  let(:save_register) { Disk.find disk_used.id }
  it { disk_used.class == Disk.new.class }
  it { disk_used == save_register }
end