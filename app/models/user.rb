class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true

  has_many :items
  has_many :orders
end

# メモ書き エラーメッセージを日本語にするための試み。devise.en.ymlもいじる必要あるかも
# validates :nickname, presence: { message: "ニックネームの入力は必須です" }
# validates :password, presence: { message: "パスワードの入力は必須です" },
# format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "パスワードは半角英数字混合で入力してください" },
# confirmation: { message: "パスワードが一致しません" }
# validates :first_name, presence: { message: "名前の入力は必須です" },
# format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "名前は全角（漢字・ひらがな・カタカナ）で入力してください" }
# validates :last_name, presence: { message: "苗字の入力は必須です" },
# format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "苗字は全角（漢字・ひらがな・カタカナ）で入力してください" }
# validates :first_name_kana, presence: { message: "名前(カナ)の入力は必須です" },
# format: { with: /\A[ァ-ヶー－]+\z/, message: "名前(カナ)は全角（カタカナ）で入力してください" }
# validates :last_name_kana, presence: { message: "苗字(カナ)の入力は必須です" },
# format: { with: /\A[ァ-ヶー－]+\z/, message: "苗字(カナ)は全角（カタカナ）で入力してください" }
# validates :birth_day, presence: {message: "誕生日は「年」「月」「日」の入力が必須です"}
