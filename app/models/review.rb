class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  enum day: { ordinary: 0, weekend: 1, ordinary_limit: 2, weeekend_limit: 3 }
  enum time: { open: 0, am: 1, noon: 2, afternoon: 3, early_evening: 4, evening: 5 }
  enum congestion: { empty: 0, full: 1, admission_limit_bit: 2, admission_limit: 3, admission_limit_many: 4 }
  
end
