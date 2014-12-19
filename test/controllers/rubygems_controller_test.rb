require 'test_helper'

class RubygemsControllerTest < ActionController::TestCase
  setup do
    @rubygem = rubygems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rubygems)
  end

  test "should create rubygem" do
    assert_difference('Rubygem.count') do
      post :create, rubygem: { authors: @rubygem.authors, bug_tracker_uri: @rubygem.bug_tracker_uri, dependencies_development: @rubygem.dependencies_development, dependencies_runtime: @rubygem.dependencies_runtime, documentation_uri: @rubygem.documentation_uri, downloads: @rubygem.downloads, gem_uri: @rubygem.gem_uri, homepage_uri: @rubygem.homepage_uri, info: @rubygem.info, licenses: @rubygem.licenses, mailing_list_uri: @rubygem.mailing_list_uri, name: @rubygem.name, platform: @rubygem.platform, project_uri: @rubygem.project_uri, source_code_uri: @rubygem.source_code_uri, version_downloads: @rubygem.version_downloads, version_latest: @rubygem.version_latest, wiki_uri: @rubygem.wiki_uri }
    end

    assert_response 201
  end

  test "should show rubygem" do
    get :show, id: @rubygem
    assert_response :success
  end

  test "should update rubygem" do
    put :update, id: @rubygem, rubygem: { authors: @rubygem.authors, bug_tracker_uri: @rubygem.bug_tracker_uri, dependencies_development: @rubygem.dependencies_development, dependencies_runtime: @rubygem.dependencies_runtime, documentation_uri: @rubygem.documentation_uri, downloads: @rubygem.downloads, gem_uri: @rubygem.gem_uri, homepage_uri: @rubygem.homepage_uri, info: @rubygem.info, licenses: @rubygem.licenses, mailing_list_uri: @rubygem.mailing_list_uri, name: @rubygem.name, platform: @rubygem.platform, project_uri: @rubygem.project_uri, source_code_uri: @rubygem.source_code_uri, version_downloads: @rubygem.version_downloads, version_latest: @rubygem.version_latest, wiki_uri: @rubygem.wiki_uri }
    assert_response 204
  end

  test "should destroy rubygem" do
    assert_difference('Rubygem.count', -1) do
      delete :destroy, id: @rubygem
    end

    assert_response 204
  end
end
