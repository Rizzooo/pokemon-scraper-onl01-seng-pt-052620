class Pokemon
<<<<<<< HEAD
  attr_accessor :name, :type, :db, :id
=======
  attr_accessor :name, :type
  attr_reader :id
>>>>>>> ccee5079b196fa8cd214c10e739f5ec31e9bc94e
  
  def initialize(name:, type:, db:, id:)
    @name = name 
    @type = type
    @db = db
    @id = id
  end
  
<<<<<<< HEAD
  def self.save(name, type, db)
    prepared = db.prepare(" INSERT INTO pokemon (name, type)
        VALUES (?, ?)")
      
    prepared.execute(name, type)
  end
  
  def self.find(id, db)
    prepared = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    outcome = prepared.execute(id)
    
    result = outcome.map do |row|
      pokemon = Pokemon.new(name: row[1], type: row[2], db: db,  id: id)
      pokemon
    end
    result[0]
=======
  def self.save
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      
    @db.execute(sql, self.name, self.type)
    @id = @db.execute("SELECT last_insert_rowid() from pokemon")[0][0]
>>>>>>> ccee5079b196fa8cd214c10e739f5ec31e9bc94e
  end
end
