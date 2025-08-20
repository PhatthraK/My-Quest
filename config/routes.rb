Rails.application.routes.draw do
  # เปลี่ยนจาก resources :tasks เป็นบรรทัดนี้
  resources :tasks, except: [:show]

  get "pages/home"
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "tasks#index"
  get "/brag-doc", to: "pages#brag_doc"
end
