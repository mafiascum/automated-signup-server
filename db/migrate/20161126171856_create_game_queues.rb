class CreateGameQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :game_queues do |t|
      t.string :name
      t.integer :forum_id

      t.timestamps
    end
  end
end
