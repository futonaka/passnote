class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :validate_user!

  respond_to :html

  def index
    redirect_to notes_path
  end

  def show
    respond_with(@entry)
  end

  def new
    @entry = Entry.new
    respond_with(@entry)
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    respond_with(@entry)
  end

  def update
    @entry.update(entry_params)
    respond_with(@entry)
  end

  def destroy
    @entry.destroy
    respond_with(@entry)
  end

  def list
    @entries = Entry.where(note_id: params[:note_id])
    respond_with(@entries)
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:note_id, :author_id, :weather, :date, :body)
    end

    def validate_user!
      if @entry && !@entry.note.users.include?(current_user)
        redirect_to notes_path, alert: "参照権限の無い日記です"
      end
    end
end
