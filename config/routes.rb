Rails.application.routes.draw do
 devise_for :users, :controllers => { registrations: 'registrations' } 
 root 'home#index'
 
 get 'home/index'     #홈
 get'home/app_index'
 get 'home/mypage/:user_id'=>"home#mypage"   #고객마이페이지
 get 'home/app_mypage/:user_id' => "home#app_mypage"
 post 'home/mypage/:user_id'=>"home#mypage"
 post 'home/app_mypage/:user_id' => "home#app_mypage"

 get 'home/mypage2/:user_id'=>"home#mypage2"
  get 'home/app_mypage2/:user_id'=>"home#app_mypage2"

 get 'home/company_p/:company_id'=>"home#company_p"  #업체별페이지
 get 'home/app_company_p/:company_id'=>"home#app_company_p"  #업체별페이지

 post 'home/company_p/:company_id'=>"home#company_p"  #업체별페이지
 post 'home/app_company_p/:company_id'=>"home#app_company_p"  #업체별페이지

 get 'home/company' #업체관리페이지
 get 'home/company_add' #업체등록
 post 'home/company_add2' #업체등록2
 post 'home/sort_add'
 get 'home/sort_p/:csort_id' =>"home#sort_p" #분류별로업체봄
 get 'home/app_sort_p/:csort_id' =>"home#app_sort_p" #분류별로업체봄

 post 'home/nticket'        #번호표뽑기
 get 'home/post'     #공지사항
 get 'home/app_post'
 get 'home/post_write'  #공지사항올리기
 post 'home/post_write2' 
 get 'home/post_p/:post_id'=>"home#post_p"
 get 'home/mycompany/:com' =>"home#mycompany"  #자기업체보기
 get 'home/c_manage'
 post 'home/c_manage2'
 get 'home/market_p/:company_id' =>"home#market_p"
 post 'home/market_p/:company_id' =>"home#market_p"
 post 'home/open'
 post 'home/close'
 post 'home/nticket_d'
 get 'home/admin'
 post 'home/search'
 post 'home/app_search'
 get 'home/real_nticket/:company_id'=>"home#real_nticket"
 post 'home/real_nticket/:company_id'=>"home#real_nticket"
 post 'home/real_nticket_add'

 post 'home/nticket_cancel'
 get 'home/reservation/:company_id' => "home#reservation"
 get 'home/app_reservation/:company_id' => "home#app_reservation"

 post 'home/reservation_add'
 get 'home/reservation2/:reservation_id'=>"home#reservation2"
 post 'home/reserve_confirm'
 post 'home/reserve_reject'

 get 'androidrequest/login_request'
 get 'androidrequest/sort_request'
 get 'androidrequest/company_request'
 get 'androidrequest/nticket_request'
 get 'androidrequest/reserve_request'
 get 'androidrequest/mypage_request_nticket'
 get 'androidrequest/mypage_request_reservation'
 get 'androidrequest/signup_request'
 get 'androidrequest/test'
 get 'androidrequest/nticket_request_company'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
