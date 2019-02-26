class Photo < ApplicationRecord
      validates_presence_of :name
  attachment :file
  validates_presence_of :file
  
  
  
   validates :usrename,    length: { minimum: 2 }       # 「1文字以上」
  validates :usrename,    length: { maximum: 20 }      # 「75文字以下」
  # validates :usrename, password: ture,length: { maximum:20}

end
