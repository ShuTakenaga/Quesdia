class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
      create_table :ideas do |t|
      t.string :description #どんなサイト・アプリ？
      t.text :about #サービスの簡単な説明をしよう
      t.string :concept #コンセプト
      t.string :name #サービス名
      t.string :core #コア機能
      t.string :sab #サブ機能
      t.string :technology #どんな技術を使う？
      t.string :age #誰が使う?(年齢)
      t.string :gender #誰が使う?(性別)
      t.string :target_user #誰が使う?(職業)
      t.string :whom #誰に使う？
      t.string :when #いつ使う？
      t.string :where #どこで使う？どんな場面で使う？
      t.string :why #なぜ作る？
      t.string :how #どうやって使う？
      t.string :howmany #どのくらいの規模？
      t.string :howmuch #いくらで？(費用,金額)
      t.string :howlong #どのくらいの間作る？いつまでにリリースする？
      t.string :last #最終的にどうなってほしい？
      t.text :email
      t.text :other #その他
      t.text :comment #コメント
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
