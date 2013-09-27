class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.belongs_to :question
      t.text :possible_response
      t.timestamps
    end
  end
end
