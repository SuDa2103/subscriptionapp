class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.float :price
      t.datetime :start_date
      t.string :billing_frequency

      t.timestamps
    end
  end
end
