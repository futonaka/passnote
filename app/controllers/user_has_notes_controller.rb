class UserHasNotesController < ApplicationController
  before_action :set_user_has_note, only: [:show, :edit, :update, :destroy]

  # GET /user_has_notes
  # GET /user_has_notes.json
  def index
    @user_has_notes = UserHasNote.all
  end

  # GET /user_has_notes/1
  # GET /user_has_notes/1.json
  def show
  end

  # GET /user_has_notes/new
  def new
    @user_has_note = UserHasNote.new
  end

  # GET /user_has_notes/1/edit
  def edit
  end

  # POST /user_has_notes
  # POST /user_has_notes.json
  def create
    @user_has_note = UserHasNote.new(user_has_note_params)

    respond_to do |format|
      if @user_has_note.save
        format.html { redirect_to @user_has_note, notice: 'User has note was successfully created.' }
        format.json { render :show, status: :created, location: @user_has_note }
      else
        format.html { render :new }
        format.json { render json: @user_has_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_has_notes/1
  # PATCH/PUT /user_has_notes/1.json
  def update
    respond_to do |format|
      if @user_has_note.update(user_has_note_params)
        format.html { redirect_to @user_has_note, notice: 'User has note was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_has_note }
      else
        format.html { render :edit }
        format.json { render json: @user_has_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_has_notes/1
  # DELETE /user_has_notes/1.json
  def destroy
    @user_has_note.destroy
    respond_to do |format|
      format.html { redirect_to user_has_notes_url, notice: 'User has note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_has_note
      @user_has_note = UserHasNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_has_note_params
      params.require(:user_has_note).permit(:user_id, :note_id)
    end
end
