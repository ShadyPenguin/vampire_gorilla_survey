class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :choice
      t.integer :question_id
      t.timestamps
    end
  end
end
