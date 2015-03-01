require "test_helper"

class Api::ErrorsControllerTest < ActionController::TestCase
  test 'bad request error on get' do
    get :bad_request, format: :json
    assert_response :bad_request
  end

  test 'bad request error on post' do
    post :bad_request, format: :json
    assert_response :bad_request
  end

  test 'bad request error on put' do
    put :bad_request, format: :json
    assert_response :bad_request
  end

  test 'bad request error on delete' do
    delete :bad_request, format: :json
    assert_response :bad_request
  end
end
