Rails.application.routes.draw do
  # add the seven routes of the CRUD for our Quote resource
  resources :quotes

  # How NOT to close or erase a turbo_frame 
  # get 'close_form', to: 'quotes#close_edit', as: 'close_quote_edit_form'
  # get 'close_frame_tag', to: 'application#close_turbo_frame', as: 'close_turbo_frame'

end
