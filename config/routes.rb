Rails.application.routes.draw do
  root to: redirect("/products")
  resources :products
end
