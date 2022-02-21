class CreateBoughtRecs < ActiveRecord::Migration[6.0]
  def change
    create_table :bought_recs do |t|

      t.timestamps
    end
  end
end
