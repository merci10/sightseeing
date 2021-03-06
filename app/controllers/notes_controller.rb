class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # before_action :current, only:[:edit, :update, :destroy]


  def search
    @user = User.where('prefecture_name LIKE(?)', "%#{params[:keyword]}%").first
    @users = User.where('prefecture_name LIKE(?)', "%#{params[:keyword]}%")
    @search_answers = []
    @users.each do |user|
      @search_answers += user.notes
    end
    
    gmaps_markers(@search_answers)
    # @search_answers = @search_answers.order("created_at DESC")
  end

  def index
    @notes = Note.all
    @title = "投稿一覧"
  end

  def show
    @comments = @note.comments.includes(:user)
    if @note.address
      gmaps_markers(@note)
    end
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    file = params[:note][:image]
    @note.set_image(file)
    if @note.save
      redirect_to @note, notice: "投稿が保存されました"
    else
      render :new
    end
  end

  def update
    file = params[:note][:image]
    @note.set_image(file)
    if @note.update(note_params)
      redirect_to @note, notice: "投稿が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to user_path(@note.user.id), notice: "投稿が削除されました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :content, :address)
    end

    def current
      note = Note.find(params[:id])
      if !current_user?(note.user)
        redirect_to root_path
      end
    end
end
