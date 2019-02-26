class User < ApplicationRecord
       devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates :email, uniqueness: true
         has_many :books, dependent: :destroy
          validates :username, presence: true, uniqueness: true, length: {maximum: 20}
          attachment :profile_image
         validates :username, length: { in: 2..20  } 

 
  validates :introduction,    length: { maximum: 50 }      # 「75文字以下」
  # validates :usrename, password: ture,length: { maximum:20}

  
 
       
 
   
  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
