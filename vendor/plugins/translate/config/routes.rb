 Rails.application.routes.draw do
  if Rails.env == 'development'
    match 'translate' => 'translate#index', :as => :translate_list
    match 'translate/translate' => 'translate#translate', :as => :translate
    match 'translate/reload' => 'translate#reload', :as => :translate_reload
  end
end
