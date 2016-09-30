Rails.application.routes.draw do
  resources :playgrounds
  root to: redirect("/playgrounds/new")
end
