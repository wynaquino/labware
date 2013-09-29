Labware::Application.routes.draw do




   match '/contact' => 'public#contact'
   match '/about' => 'public#about'
   match '/privacy' => 'public#privacy'
   root :to => "public#index"


   
   devise_for :users, :layout => "devise"

    resources :users, :path => 'u', :except => [:index, :create, :new]  do
        get "comments/latest" => "users#comments_latest"
        get "posts/latest_comment" => "users#posts_latest_comment"
        resources :assets, :except => [:edit, :update]
    end





    resources :posts, :except => [:index,:new, :show,:edit, :update] do
      post "replies" => "comments#create_reply", :as => "create_reply"
      resources :comments, :except => [:index] do
          post "replies" => "comments#create_reply", :as => "create_reply"
          get "replies/new" => "comments#new_reply", :as => "new_reply" 
        
          resource :vote, :except => [:index, :edit, :show, :update, :new, :create] do          
            post "vote" => "votes#create_comment_vote", :as => "comment"
          end       
          #get "latest", "oldest", :on => :collection
      end
      resource :vote, :only => [:create] 
      
    end
 
  
    resources :groups, :path => 'g',:except => [:index] do


      
      resources :posts, :path => 'p', :except => [:index] do

        get "latest_comments" => "posts#latest_comments"
        get "oldest_comments" => "posts#oldest_comments"
        get "highest_voted_comments" => "posts#highest_voted_comments"
       #post "thumbs_up" => "vote#create", :as => "thumbs_up"       
      end
      get "group_posts_latest_comment" => "groups#group_posts_latest_comment"
      get "group_posts_most_voted" => "groups#group_posts_most_voted"
      
      resources :subscriptions, :except => [:index, :edit, :show, :update, :new] 
    end


    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    root to: "admin/dashboard#index"
  

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
end
