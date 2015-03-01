Rails.application.routes.draw do
  scope module: :api, defaults: { format: 'json' } do
    get '/allocate/:username', to: 'resources#allocate'
    get '/deallocate/:resource_name', to: 'resources#deallocate'
    get '/list(/:username)', to: 'resources#list'
    get '/reset', to: 'resources#reset'
  end
end
