class Api::ErrorsController < Api::ApplicationController
  def bad_request
    respond_to do |format|
      format.json { render text: 'Bad Request.', status: :bad_request }
    end
  end
end
