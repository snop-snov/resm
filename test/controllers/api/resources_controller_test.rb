require "test_helper"

class Api::ResourcesControllerTest < ActionController::TestCase
  def user
    @user ||= create :user
  end

  test 'success allocate' do
    create :deallocated_resource

    get :allocate, username: user.name, format: :json
    assert_response :created

    assert { Resource.allocated.any? }
  end

  test 'allocate error' do
    assert { Resource.deallocated.empty? }

    get :allocate, username: user.name, format: :json
    assert_response :service_unavailable
  end

  test 'success deallocate' do
    resource = create :allocated_resource

    get :deallocate, resource_name: resource.name, format: :json
    assert_response :no_content

    assert { Resource.allocated.empty? }
  end

  test 'deallocate error' do
    resource = create :deallocated_resource

    get :deallocate, resource_name: resource.name, format: :json
    assert_response :not_found
  end

  test 'get list' do
    get :list, format: :json
    assert_response :ok
  end

  test 'get list for user' do
    get :list, username: user.name, format: :json
    assert_response :ok
  end

  test 'reset resources' do
    resource = create :allocated_resource

    get :reset, format: :json
    assert_response :no_content

    assert { Resource.allocated.empty? }
  end
end
