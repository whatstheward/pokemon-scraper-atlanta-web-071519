class Pokemon
    attr_accessor :id, :name, :type, :hp, :db
    
    def initialize(id:, name:, type:, hp: nil, db:)
    @id = id 
    @name = name 
    @type = type
    @hp = hp
    @db = db    
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id=#{id}")
        Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], hp: pokemon[0][3], db: db)
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end

  end
