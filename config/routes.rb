Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
end
