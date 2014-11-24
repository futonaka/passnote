class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :validate_user!, except: [:index]

  respond_to :html

  def index
    @notes = Note.joins(:users).where(users: {id: current_user.id})
    respond_with(@notes)
  end

  def show
    respond_with(@note)
  end

  def new
    @note = Note.new
    respond_with(@note)
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.save
    respond_with(@note)
  end

  def update
    @note.update(note_params)
    respond_with(@note)
  end

  def destroy
    @note.destroy
    respond_with(@note)
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :description)
    end

    def validate_user!
      if @note && !@note.users.include?(current_user)
        redirect_to notes_path, alert: "参照権限の無いノートです"
      end
    end
end
