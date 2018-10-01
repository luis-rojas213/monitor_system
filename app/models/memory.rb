class Memory < ApplicationRecord
  enum memory: [ :ram, :swap ]
end
