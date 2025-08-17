require 'active_record'

class CreateTestResults < ActiveRecord::Migration[7.1]
  def change
    create_table :test_results do |t|
      t.references :task, foreign_key: true
      t.string :status
      t.text :details
      t.timestamps
    end
  end
end
