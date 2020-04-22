require "sqlite3"


DB = SQLite3::Database.new("tasks.db")

DB.results_as_hash = true
require_relative "task"

# TODO: CRUD some tasks

# READ (One)
# task = Task.find(1)
# puts task.title


# CREATE/UPDATE

# task = Task.new(title: "Fill the beers rack in the fridge", description: "Vegetables should be moved somewhere else.")
# task.save
# tasks = Task.all
# tasks.last.description = "Amazing livecode"
# tasks.last.save

# p tasks


# DELETE

# task = Task.find(4)
# task.destroy

# tasks = Task.all
# p tasks.length















