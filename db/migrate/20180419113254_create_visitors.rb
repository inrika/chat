class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
      t.boolean    :moderator
      t.timestamps
    end
  end
end
