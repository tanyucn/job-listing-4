Rails.application.routes.draw do
  devise_for :users

  #  resources :jobs
  resources :jobs do
    resources :resumes
    collection do
      get :search
    end    
  end

   namespace :admin do
     resources :jobs
   end

   namespace :admin do
     resources :jobs do
       member do
         post :publish
         post :hide
       end
       resources :resumes
     end
   end

   root 'welcome#index'

end
