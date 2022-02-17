class CreateSettings < ActiveRecord::Migration<%= migration_version %>
  def self.up
    create_table :rails_settings_caches do |t|
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.timestamps
    end

    add_index :rails_settings_caches, %i(var), unique: true
  end

  def self.down
    drop_table :rails_settings_caches
  end
end
