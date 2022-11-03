class CreateGossiptags < ActiveRecord::Migration[7.0]
  def change
    create_table :gossiptags do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :gossip, index: true
      t.timestamps
    end
  end
end
