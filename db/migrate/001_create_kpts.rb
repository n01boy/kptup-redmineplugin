class CreateKpts < ActiveRecord::Migration
  def change
    create_table :kpts do |t|
      t.string :project_id
      t.string :version_id
      t.string :id
      t.string :kpt
      t.string :content
    end
  end
end
