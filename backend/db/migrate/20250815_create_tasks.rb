require 'active_record'

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name    
      t.integer :project_id
      t.timestamps
    end
  end
end
