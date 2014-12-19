class CreateRubygems < ActiveRecord::Migration
  def change
    unless table_exists?("rubygems")
      create_table :rubygems do |t|
        t.text :name
        t.text :version_latest
        t.integer :downloads
        t.integer :version_downloads
        t.text :platform
        t.text :authors
        t.text :info
        t.text :licenses
        t.text :project_uri
        t.text :gem_uri
        t.text :homepage_uri
        t.text :wiki_uri
        t.text :documentation_uri
        t.text :mailing_list_uri
        t.text :source_code_uri
        t.text :bug_tracker_uri
        t.text :dependencies_runtime
        t.text :dependencies_development

        t.timestamps
      end
    end
  end
end
