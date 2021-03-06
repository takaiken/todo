class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|

    	t.string :title
    	t.text :description, null: true
    	t.datetime :target_at, null: true
    	t.boolean :completed_at, null: false, default: false
    	t.references :user, foreign_key: true

        t.timestamps
    end
  end
end
