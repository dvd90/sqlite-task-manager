class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attr = {})
    @id = attr[:id]
    @title = attr[:title]
    @description = attr[:description]
    @done = attr[:done] || 0
  end

# READ Methods
  def self.find(id)
    # Get a specific Record (Task) from the DB
    record = DB.execute('SELECT * FROM tasks WHERE id = ?', id).first
    # If we get a record from the DB we create an new instance of Task
    record.nil? ? nil : make_instance(record)
  end

  def self.all
    # Get all Records (Task) from the DB
    records = DB.execute('SELECT * FROM tasks')
    # Iterate through Records
    records.map {|record| make_instance(record)}
  end

# CREATE/UPDATE
  def save
    @id ? update : create
  end

# DELETE
  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', @id)
  end

  private

  def self.make_instance(record)
    #Create a new 💎 instance of Task
    Task.new(
      id: record["id"],
      title: record["title"],
      description: record["description"],
      done: record["done"]
      )
  end

  def create
    DB.execute('INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)', @title, @description, @done)
    @id = DB.last_insert_row_id
  end

  def update
    DB.execute('UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?', @title, @description, @done, @id)
  end
end
