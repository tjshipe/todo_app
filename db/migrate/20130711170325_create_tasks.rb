class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :completed
      t.belongs_to :list

      t.timestamps
    end
  end
end
