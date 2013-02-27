class SetupProjectsTasksLogs < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.string :name
    end

    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.references :project, index: true
      t.timestamps
    end

    create_table :logs do |t|
      t.references :task, index: true
      t.timestamp :start
      t.timestamp :stop
    end

  end
end
