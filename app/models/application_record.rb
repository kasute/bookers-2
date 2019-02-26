class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
   validates :introduction, length: { in: 1..50  } 
  
end