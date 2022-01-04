class create_table :services do |t| 
    t.references : user , null : false , foreign_key : key 
    t.string : provider 
    t.string : uid 
    t.string : access_token
    t.string : access_token_secret 
    t.string : refresh_token 
    t.datetime : expires_at
    t.text :auth 
    t.timestamps
end
end 
end 
MIGRATION_CLASS = 
if ActiveRecord : : VERSION : : MAJOR >= 5 
     ActiveRecord : : Migration[5.2] ["# {ActiveRecord : : VERSION : : MAJOR}.# {ActionRecord : : VERSION : : MINOR}"]  
else 
    ActiveRecord : : Migration[5.2] 
end 
class CreateFriendlyIdSlugs < MIGRATION_CLASS 
    def change 
        create_table : friendly_id_slugs do |t| 
     t.string :slug , :null => false 
     t.integer : sluggable_id , : null => false 
     t.string sluggable_type , : limit => 50
     t.string : scope 
     t.datetime :created_at
        end
        add_index : friendly_id_slugs , [:sluggable_type ,:sluggable_id]
        add_index :friendly_id_slugs , [:slug , : sluggable_type] , length: { slug: 140, sluggable_type: 50 } 
        add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], length: { slug: 70, sluggable_type: 50, scope: 70 }, unique: true
    end
end 

