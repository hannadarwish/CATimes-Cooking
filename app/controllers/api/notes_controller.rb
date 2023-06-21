class Api::NotesController < ApplicationController

    def create 
        @note = Note.new(note_params)
        if @note.save
            render json: @note, status: :created 
        else    
            render json: @note.errors, status: :unprocessable_entity
        end
    end

    def update 
        @note = Note.find(params[:id])
        if @note.update(note_params)
            render json: @note, status: ok
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        render json: { message: 'Note deleted' }, status: :ok
    end

    private

    def note_params
        params.require(:note).permit(:body, :reviewer_name, :recipe_id)
    end

end
