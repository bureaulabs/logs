class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    @entries = Entry.published.order(created_at: :desc)
  end

  # GET /entries/1 or /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
		@drafts = Entry.drafts.order(created_at: :desc)
  end

  # GET /entries/1/edit
  def edit
		@categories = Category.all
		@metadata = eval(@entry.metadata_raw)
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)
		page = MetaInspector.new(@entry.og_url)
		@entry.url = page.untracked_url || page.url
		@entry.title = page.best_title
		@entry.caption = page.best_description
		@entry.metadata_raw = page.to_hash
		@entry.site = Site.where(url: page.host).first_or_create(favicon: page.images.favicon)
		respond_to do |format|
			if @entry.save
				format.html { redirect_to edit_entry_path(@entry), notice: "entry was successfully created." }
				format.json { render :show, status: :created, location: @entry }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
		@entry.is_published = true
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to new_entry_path, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy!

    respond_to do |format|
      format.html { redirect_to entries_path, status: :see_other, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.expect(entry: [ :og_url, :title, :caption, :category_id, :props, :cover ])
    end
end
