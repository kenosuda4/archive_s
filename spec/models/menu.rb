FactoryBot.define do
    factory :menu do
      name { "名前" }
      introduction { "メニュー内容" }
      total_distance { "参加条件" }
      explanation { "説明" }
      user
    end
  end