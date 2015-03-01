class Api::ResourcesController < Api::ApplicationController
  def allocate
    #NOTE use queue or transaction if high load expected
    user = User.find_or_create_by(name: params[:username])
    resource = Resource.deallocated.first

    if resource.present?
      user.resources << resource
      respond_with resource.name, status: :created
    else
      respond_with 'Out of resources.', status: :service_unavailable
    end
  end

  def deallocate
    resource = Resource.allocated.find_by(name: params[:resource_name])

    if resource.present?
      resource.update(user_id: nil)
      respond_with '', status: :no_content
    else
      respond_with 'Not allocated.', status: :not_found
    end
  end

  def list
    if params[:username].present?
      user = User.find_or_create_by(name: params[:username])
      result = user.resources.map(&:name)
    else
      allocated = Resource.allocated.map{|r| [r.name, r.user.name]}.to_h
      deallocated = Resource.deallocated.map(&:name)

      result = { allocated: allocated, deallocated: deallocated }
    end

    respond_with result, status: :ok
  end

  def reset
    Resource.update_all(user_id: nil)
    respond_with '', status: :no_content
  end
end
