# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141219223436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rubygems", force: true do |t|
    t.text    "name"
    t.text    "version_latest"
    t.integer "downloads"
    t.integer "version_downloads"
    t.text    "platform"
    t.text    "authors"
    t.text    "info"
    t.text    "licenses",                 array: true
    t.text    "project_uri"
    t.text    "gem_uri"
    t.text    "homepage_uri"
    t.text    "wiki_uri"
    t.text    "documentation_uri"
    t.text    "mailing_list_uri"
    t.text    "source_code_uri"
    t.text    "bug_tracker_uri"
    t.text    "dependencies_runtime",     array: true
    t.text    "dependencies_development", array: true
  end

  create_table "rubygemsnew", force: true do |t|
    t.text    "name"
    t.text    "version_latest"
    t.integer "downloads"
    t.integer "version_downloads"
    t.text    "platform"
    t.text    "authors"
    t.text    "info"
    t.text    "licenses",                 array: true
    t.text    "project_uri"
    t.text    "gem_uri"
    t.text    "homepage_uri"
    t.text    "wiki_uri"
    t.text    "documentation_uri"
    t.text    "mailing_list_uri"
    t.text    "source_code_uri"
    t.text    "bug_tracker_uri"
    t.text    "dependencies_runtime",     array: true
    t.text    "dependencies_development", array: true
  end

end
