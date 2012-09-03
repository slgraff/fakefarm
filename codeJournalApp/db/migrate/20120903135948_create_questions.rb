class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :visibility
      t.string :topic
      t.string :size

      t.timestamps
    end
  end
end
