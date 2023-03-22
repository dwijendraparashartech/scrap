class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :image_link
      t.string :website
      t.string :company_url
      t.string :founding_year

      t.timestamps
    end
  end
end
