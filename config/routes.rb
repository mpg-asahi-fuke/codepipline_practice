Rails.application.routes.draw do
  namespace :admin do
    resource :sessions
    resources :companies do
      resources :ir_reports do
        resources :summaries
      end
    end
  end

  scope module: :end_user do
    resources :ir_reports, only: [ :index ]
    root "ir_reports#index"
  end
end
