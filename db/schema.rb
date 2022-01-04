ActiveRecord :: Schema.define(version : 2021_04_14_140152) do 
    create_table "action_text_rich_texts" , force :: cascade do |do|  
        t.string "name" , null : false 
        t.text "body" 
        t.string "record_type" ,null : false 
        t.bigint "record_id" , null : false 
        t.integer "blob_id" , null : false 
        t.datatime "created_at" , null : false 
        t.index ["record_type", "record_id", "name"] , name : "index_action_texts_uniqueness" ,"index_action_texts_uniqueness" , unique : true 
    end 

         
create_table "active_storage_attachments" , force : : cascade do |t| 
    t.string "name" , null : false 
    t.string "record_type" , null : false 
    t.integer "record_id" ,null : false 
    t.integer "blob_id" , null : false 
    t.datatime "created_at" , null : false  
    t.index ["blob_id"] , name :"index_active_storage_attachments_on_blob_id" 
    t.index ["record_type" , "record_id" , "name", "blob_id"] , name : "index_active_storage_attachments_uniqueness"  , unique = true 
end 

create_table "active_storage_variant_records" , force : cascade do |t| 
    t.integer "blob_id" , null : false 
    t.string "variation_digest" , null : false 
    t.index ["blob_id", "variation_digest"] , name : "index_active_storage_variant_uniqueness" , unique : true 
end 

create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "friendly_id_slugs" , force : : cascade do |t| 
    t.string "slug" , null : false 
    t.integer "sluggable_id" , null : false 
    t.string "sluggabble_type" , limit : 50 
    t.string "scope" 
    t.datetime "created_at" 
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end
  create_table "notifications" , force : : cascade do |t| 
    t.string "recipient_type " , null : false 
    t.integer "recipient_id" , null : false 
    t.string "type" , null : false 
    t.json "params" 
    t.datetime  "created_at" , precision :6 , null : false 
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end
  create_table "posts" , force: cascade do |t| 
    t.string "title" 
    t.datetime "published_at" 
    t.datetime "created_at" ,precision :6 ,null :false 
    t.datetime "updated_at" ,j precision : 6 , null : false 
  end 
  create_table "services" , force : : cascade do |t|
    t.integer "user_id" ,null : false 
    t.string "provider" 
    t.string "uid" 
    t.string "access_token"
    t.string "accesss_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end
  create_table "users" , force : : cascade do |t| 
    t.string "email" , default : " " , null : false 
    t.string "encrypted_password" , default : "" ,  null : false 
    t.string "reset_password_token" , default : "" , null : false 
    t.datetime "remember_created_at" 
    t.string  "first_name" 
    t.string "last_name" 
    t.datetime  "announcements_last_read_at " 
    t.boolean "admin" , dafault : "" , null : false
    t.datetime "created_at" , precision : 6 , null : false 
    t.datetime "updated_at" , precision : 6 , null : false 
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end 
   add_foreign_key "active_storage_attachments" , "active_storage_blobs", column : "blob_id" 
   add_foreign_key "active_storage_variant_records", "active_storage_blobs" , column :"blob_id" 
   add_foreign_key "services", "users"
end



