class RubygemsController < ApplicationController
  # GET /rubygems
  # GET /rubygems.json
  def index
    # @rubygems = Rubygem.all
    # render json: @rubygems
  end

  # GET /rubygems/1
  # GET /rubygems/1.json
  def show
    @rubygem = Rubygem.find(params[:id])

    render json: @rubygem
  end

  def showarray
    gemlist = params[:gemlist].split(',')
    @rubygem = Rubygem.where("name IN (?)", gemlist).to_a
    render json: @rubygem
  end

  # POST /rubygems
  # POST /rubygems.json
  def create
    @rubygem = Rubygem.new(rubygem_params)

    if @rubygem.save
      render json: @rubygem, status: :created, location: @rubygem
    else
      render json: @rubygem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rubygems/1
  # PATCH/PUT /rubygems/1.json
  def update
    @rubygem = Rubygem.find(params[:id])

    if @rubygem.update(rubygem_params)
      head :no_content
    else
      render json: @rubygem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rubygems/1
  # DELETE /rubygems/1.json
  def destroy
    @rubygem = Rubygem.find(params[:id])
    @rubygem.destroy

    head :no_content
  end

  private
    
    def rubygem_params
      params.require(:rubygem).permit(:name, :version_latest, :downloads, :version_downloads, :platform, :authors, :info, :licenses, :project_uri, :gem_uri, :homepage_uri, :wiki_uri, :documentation_uri, :mailing_list_uri, :source_code_uri, :bug_tracker_uri, :dependencies_runtime, :dependencies_development)
    end
end
