class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to note_path(@note.id), notice: "投稿が保存されました"
    else
      render :new
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    if @note.update(note_params)
      redirect_to note_path(@note.id), notice: "投稿が更新されました"
    else
      render :edit
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:image, :content)
    end
end
