class LogsController < ApplicationController
  before_action :set_log, only: %i[ show edit update destroy ]
	
	require "pp"

  # GET /logs or /logs.json
  def index
    @logs = Log.order(created_at: :desc)
  end

  # GET /logs/1 or /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs or /logs.json
  def create
    @log = Log.new(log_params)
		page = MetaInspector.new(@log.og_url)
		@log.url = page.untracked_url || page.url
		@log.title = page.best_title
		@log.caption = page.best_description
		@log.metadata_raw = page.to_hash
		@log.site = Site.where(url: page.host).first_or_create(favicon: page.images.favicon)
    respond_to do |format|
      if @log.save
        format.html { redirect_to edit_log_path(@log), notice: "Log was successfully created." }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1 or /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to root_path, notice: "Log was successfully updated." }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    @log.destroy!

    respond_to do |format|
      format.html { redirect_to logs_path, status: :see_other, notice: "Log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.expect(log: [ :og_url, :url, :slug, :title, :caption, :category_id, :cover])
    end
end
