class TimetablingController < ApplicationController

def update
    params[:key]
    params[:subject_id]

    respond_to do |format|
        format.json{ render json: {ok: 'done'}, status: :ok }
    end
end

end
