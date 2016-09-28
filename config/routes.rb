Rails.application.routes.draw do
  root to: redirect("/playgrounds/new")
end
