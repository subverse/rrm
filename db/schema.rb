# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110110193334) do

  create_table "ingredients", :force => true do |t|
    t.integer  "recipe_id"
    t.float    "amount"
    t.integer  "unit_id"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ingred_id"
  end

  create_table "ingreds", :force => true do |t|
    t.string   "name"
    t.integer  "ingredtype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id",       :default => 5
  end

  create_table "ingredtypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", :force => true do |t|
    t.string   "owner",      :limit => 40
    t.integer  "recipe_id",  :limit => 10
    t.integer  "shop_it",    :limit => 1,  :default => 0
    t.integer  "print_it",   :limit => 1,  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incl_prod",                :default => 0
    t.float    "multiplier",               :default => 1.0
  end

  create_table "recipes", :force => true do |t|
    t.integer  "station_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "length",     :default => 0
    t.integer  "ingred1"
    t.float    "amount1"
    t.integer  "unit1"
    t.integer  "ingred2"
    t.float    "amount2"
    t.integer  "unit2"
    t.integer  "ingred3"
    t.float    "amount3"
    t.integer  "unit3"
    t.integer  "ingred4"
    t.float    "amount4"
    t.integer  "unit4"
    t.integer  "ingred5"
    t.float    "amount5"
    t.integer  "unit5"
    t.integer  "ingred6"
    t.float    "amount6"
    t.integer  "unit6"
    t.integer  "ingred7"
    t.float    "amount7"
    t.integer  "unit7"
    t.integer  "ingred8"
    t.float    "amount8"
    t.integer  "unit8"
    t.integer  "ingred9"
    t.float    "amount9"
    t.integer  "unit9"
    t.integer  "ingred10"
    t.float    "amount10"
    t.integer  "unit10"
    t.integer  "ingred11"
    t.float    "amount11"
    t.integer  "unit11"
    t.integer  "ingred12"
    t.float    "amount12"
    t.integer  "unit12"
    t.integer  "ingred13"
    t.float    "amount13"
    t.integer  "unit13"
    t.integer  "ingred14"
    t.float    "amount14"
    t.integer  "unit14"
    t.integer  "ingred15"
    t.float    "amount15"
    t.integer  "unit15"
    t.integer  "ingred16"
    t.float    "amount16"
    t.integer  "unit16"
    t.integer  "ingred17"
    t.float    "amount17"
    t.integer  "unit17"
    t.integer  "ingred18"
    t.float    "amount18"
    t.integer  "unit18"
    t.integer  "ingred19"
    t.float    "amount19"
    t.integer  "unit19"
    t.integer  "ingred20"
    t.float    "amount20"
    t.integer  "unit20"
    t.integer  "ingred21"
    t.float    "amount21"
    t.integer  "unit21"
    t.integer  "ingred22"
    t.float    "amount22"
    t.integer  "unit22"
    t.integer  "ingred23"
    t.float    "amount23"
    t.integer  "unit23"
    t.integer  "ingred24"
    t.float    "amount24"
    t.integer  "unit24"
    t.integer  "ingred25"
    t.float    "amount25"
    t.integer  "unit25"
    t.integer  "ingred26"
    t.float    "amount26"
    t.integer  "unit26"
    t.integer  "ingred27"
    t.float    "amount27"
    t.integer  "unit27"
    t.integer  "ingred28"
    t.float    "amount28"
    t.integer  "unit28"
    t.integer  "ingred29"
    t.float    "amount29"
    t.integer  "unit29"
    t.integer  "ingred30"
    t.float    "amount30"
    t.integer  "unit30"
    t.integer  "ingred31"
    t.float    "amount31"
    t.integer  "unit31"
    t.integer  "ingred32"
    t.float    "amount32"
    t.integer  "unit32"
    t.integer  "ingred33"
    t.float    "amount33"
    t.integer  "unit33"
    t.integer  "ingred34"
    t.float    "amount34"
    t.integer  "unit34"
    t.integer  "ingred35"
    t.float    "amount35"
    t.integer  "unit35"
    t.integer  "ingred36"
    t.float    "amount36"
    t.integer  "unit36"
    t.integer  "ingred37"
    t.float    "amount37"
    t.integer  "unit37"
    t.integer  "ingred38"
    t.float    "amount38"
    t.integer  "unit38"
    t.integer  "ingred39"
    t.float    "amount39"
    t.integer  "unit39"
    t.integer  "ingred40"
    t.float    "amount40"
    t.integer  "unit40"
    t.integer  "ingred41"
    t.float    "amount41"
    t.integer  "unit41"
    t.integer  "ingred42"
    t.float    "amount42"
    t.integer  "unit42"
    t.integer  "ingred43"
    t.float    "amount43"
    t.integer  "unit43"
    t.integer  "ingred44"
    t.float    "amount44"
    t.integer  "unit44"
    t.integer  "ingred45"
    t.float    "amount45"
    t.integer  "unit45"
    t.integer  "ingred46"
    t.float    "amount46"
    t.integer  "unit46"
    t.integer  "ingred47"
    t.float    "amount47"
    t.integer  "unit47"
    t.integer  "ingred48"
    t.float    "amount48"
    t.integer  "unit48"
    t.integer  "ingred49"
    t.float    "amount49"
    t.integer  "unit49"
    t.integer  "ingred50"
    t.float    "amount50"
    t.integer  "unit50"
    t.string   "process"
    t.integer  "source_id"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "info"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
