# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project = Project.create(name: 'Cut a tree')

done = Task.create(name: 'Buy an axe', project: project, done: true)
Log.create(task: done, start: done.created_at, stop: done.created_at + 1.minute)

running = Task.create(name: 'Locate the tree', project: project)
Log.create(task: running, start: running.created_at, stop: running.created_at + 1.minute)
Log.create(task: running, start: running.created_at + 2.minutes, stop: running.created_at + 4.minutes)

work = Task.create(name: 'Chop chop chop', project: project)
Log.create(task: work, start: work.created_at, stop: work.created_at + 1.minute)
Log.create(task: work, start: work.created_at + 5.minutes, stop: work.created_at + 8.minutes)

Task.create(name: 'Take pictures', project: project)
