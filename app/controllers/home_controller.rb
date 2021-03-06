class HomeController < ApplicationController
  def index     #홈페이지
    @c_user = current_user
    @company = Company.all
    @sort = Csort.all
  end
  
  def app_index    #홈페이지
    @c_user = current_user
    @company = Company.all
    @sort = Csort.all
  end
  
  def mypage     #고객마이페이지
    if user_signed_in?
      @c_user = current_user
    else
      redirect_to "/users/sign_in"
    end
    
    @company = []
    @recommend = Recommend.all
    @nticket = Nticket.all
    @nticket2 = Nticket.where(:user_id => current_user)
    @nticket2.each do |n|
      @company << Company.where(:id => n.company_id)
      
    end
    
    @reservation = Reservation.where(:user_id => current_user)
    
    
    
  end
  
  
  
   def app_mypage     #고객마이페이지
    if user_signed_in?
      @c_user = current_user
    else
      redirect_to "/users/sign_in"
    end
    
    @company = []
    @nticket = Nticket.all
    @nticket2 = Nticket.where(:user_id => current_user)
    @nticket2.each do |n|
      @company << Company.where(:id => n.company_id)
    end
    
    @reservation = Reservation.where(:user_id => current_user)
    
    
  end
  
  def mypage2
    @user = User.all
    @user2 = User.where("id LIKE ?",params[:user_id])[0]
    
  end
  
  def app_mypage2
    @user = User.all
    @user2 = User.where("id LIKE ?",params[:user_id])[0]
    
  end
  
  def company_p       #업체페이지
    @company = Company.all
    @user = User.all
    @company_p = Company.where("id LIKE ?",params[:company_id])[0]
    @nticket2 = Nticket.all
    @nticket = Nticket.where("company_id LIKE ?",params[:company_id])
    @nticket3 = @nticket.where(:user_id => current_user).length
    @sort = Csort.where(:id=> @company_p.csort_id)[0]
    
    @reservation = Reservation.where("company_id LIKE ?",params[:company_id])
    @reservation1 = @reservation.where("confirm_num LIKE ?",1)
    @reservation2 = @reservation1.where(:user_id => current_user).length
    
    
  end
  
  def app_company_p       #업체페이지
    @company = Company.all
    @user = User.all
    @company_p = Company.where("id LIKE ?",params[:company_id])[0]
    @nticket2 = Nticket.all
    @nticket = Nticket.where("company_id LIKE ?",params[:company_id])
    @nticket3 = @nticket.where(:user_id => current_user).length
    @sort = Csort.where(:id=> @company_p.csort_id)[0]
    
    @reservation = Reservation.where("company_id LIKE ?",params[:company_id])
    @reservation1 = @reservation.where("confirm_num LIKE ?",1)
    @reservation2 = @reservation1.where(:user_id => current_user).length
    
    
  end
  
  def company         #업체관리페이지
    @company = Company.all
    @sort = Csort.all
  end
  
  def company_add        #업체추가페이지
    @sort = Csort.all
  end
  
  def company_add2        #업체추가되는곳
    @company = Company.all
    
    company = Company.new
    company.name = params[:name]
    company.c_postcode = params[:c_postcode]
    company.c_address = params[:c_address]
    company.c_daddress = params[:c_daddress]
    company.tel = params[:tel]
    company.opentime = params[:opentime]
    company.closetime = params[:closetime]
    company.csort_id = params[:sort]
    company.save
    
    redirect_to "/home/company"
  end
  
  def sort_add   #분류추가
    sort = Csort.new
    sort.name = params[:sort]
    sort.save
    
    redirect_to "/home/company"
  end
  
  def sort_p   #분류별로업체보기
    @sort = Csort.all
    @company_s = Company.where("csort_id LIKE ?",params[:csort_id])
    @csort_id = params[:csort_id]
    @lat = params[:lat]
    @lng = params[:lng]
    
  end
  
  def app_sort_p   #분류별로업체보기
    @sort = Csort.all
    @company_s = Company.where("csort_id LIKE ?",params[:csort_id])
    
  end
  
  def nticket   #대기표뽑는페이지
   
    @nticket = Nticket.all
    ntic = Nticket.new
    ntic.user_id = current_user.id
    ntic.company_id = params[:company_id]
    @nticketmax = Company.where(:id => params[:company_id])[0].nticket_max
    ntic.ticketnumber = @nticketmax
    ntic.save
    
    company = Company.where(:id => params[:company_id])[0]
    company.nticket_max = @nticketmax+1
    company.save
    
    
    redirect_to(request.env['HTTP_REFERER']) 
  end
  
  def real_nticket
    @nticket = Nticket.new
    @company_id = params[:company_id]
    @company_p = Company.where(:id => @company_id)[0]
    @sort = Csort.where(:id=> @company_p.csort_id)[0]
  end
  
  def real_nticket_add
    real_nticket = Nticket.new
    real_nticket.user_id = 0
    real_nticket.company_id = params[:company_id]
    real_nticket.user_name = params[:user_name]
    real_nticket.user_phone = params[:user_phone]
    @nticketmax = Company.where(:id => params[:company_id])[0].nticket_max
    real_nticket.ticketnumber = @nticketmax
    real_nticket.save
    
    company = Company.where(:id => params[:company_id])[0]
    company.nticket_max = @nticketmax+1
    company.save
    
  end
  
  def post
    @post = Post.all
    @user = current_user
  end
  
  def app_post
    @post = Post.all
    @user = current_user
  end
  
  def post_p
    @post = Post.all
  end

  def app_post_p
    @post = Post.all
  end
  
  def post_write
    
  end
  
  def post_write2
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.user_id = current_user.id
    post.save
    
    redirect_to "/home/post"
  end
  
  def mycompany
    if user_signed_in?
      @c_user = current_user
    else
      redirect_to "/users/sign_in"
    end
  end
  
  def c_manage
    @user = User.where("num LIKE ?","2")
    @company = Company.all
  end
  
  def c_manage2
    @company = params[:company_ids]
    @user = params[:user_ids]
    user = User.where("id LIKE ?",@user)[0]
    user.com = params[:company_ids]
    user.save
    
    
  end
  
  def market_p
    @company = Company.all
    @user = User.all

    @company2 = params[:company_id]
    @company_p = Company.where("id LIKE ?",params[:company_id])[0]
    @reservation = Reservation.where("company_id LIKE ?",params[:company_id])
    
    @nticket = Nticket.where("company_id LIKE ?",params[:company_id])
    @sort = Csort.where(:id=> @company_p.csort_id)[0]
  end
  
  def open
    @company_id = params[:company_id]
    @company = Company.where(:id => params[:company_id])[0]
    @company.openclose = "1"
    @company.nticket_max = 1;
    @company.save
    
    @nticket = Nticket.where(:company_id => @company_id).destroy_all
    
    
    redirect_to(request.env['HTTP_REFERER']) 
  end
  
  def close
    @company_id = params[:company_id]
    @company = Company.where(:id => params[:company_id])[0]
    @company.openclose = "2"
    @company.save
    
    redirect_to(request.env['HTTP_REFERER']) 

  end

  def nticket_d
    @user = User.all
    @nticket = Nticket.all
    @nticket_id = params[:nticket_id]
    @company = Company.all
    @company2 = params[:company_id]
    @nticket = params[:check_ids]
    Nticket.where(:id => @nticket_id).destroy_all
    
    redirect_to(request.env['HTTP_REFERER'])
  end
  
  def nticket_cancel
    @nticket = params[:nticket_val]
    Nticket.where(:company_id => @nticket, :user_id => current_user).destroy_all
  end
  
  def admin
    @user = User.all
    @company = Company.all
    
  end
  
  def search
    @search = params[:search]
    
    @search2 = Company.where("name LIKE?","%#{@search}%")
  end
  
  def app_search
    @search = params[:search]
    
    @search2 = Company.where("name LIKE?","%#{@search}%")
  end
  
  def reservation
    @company_id = params[:company_id]
    
    
  end
  
  def app_reservation
    @company_id = params[:company_id]
    
    
  end
  
  def reservation_add
    reserve = Reservation.new
    reserve.user_id = current_user.id
    reserve.company_id = params[:company_id]
    reserve.reserve_time = params[:reserve_time]
    reserve.reserve_date = params[:reserve_date]
    reserve.person_num = params[:person_num]
    reserve.requestmenu = params[:requestmenu]
    reserve.save
    
    redirect_to(request.env['HTTP_REFERER'])
  end
  
  def reservation2
    @reserve_id = params[:reservation_id]
    @reservation = Reservation.where(:id => @reserve_id)[0]
    
    @user = User.where(:id=>@reservation.user_id)[0]
    @company = Company.where(:id => @reservation.company_id)[0]
  end
  
  
  
  def reserve_confirm
    @reservation = Reservation.where(:id => params[:reservation_id])[0]
    @reservation.confirm_num = "2"
    @reservation.comment = params[:comment]
    @reservation.save
    
    redirect_to(request.env['HTTP_REFERER'])
  end
  
  def reserve_reject
    @reservation = Reservation.where(:id => params[:reservation_id])[0]
    @reservation.confirm_num = "3"
    @reservation.comment = params[:comment]
    @reservation.save
    
    redirect_to(request.env['HTTP_REFERER'])
  end
  
  def test
  end
  
  def dissort_p
     @sort = Csort.all
    @company_s = Company.where("csort_id LIKE ?",params[:csort_id])
    @csort_id = params[:csort_id]
    
    @lat = params[:lati]
    @lng = params[:long]
    @dis = []
    @com = []
    @rad_per_deg = Math::PI / 180
    @rm = 6371000 
    @company_s.each do |c|
      @lat1_rad, @lat2_rad = c.com_lat.to_f * @rad_per_deg, @lat.to_f * @rad_per_deg 
      @lon1_rad, @lon2_rad = c.com_lng.to_f * @rad_per_deg,@lng.to_f  * @rad_per_deg
      @a = Math.sin((@lat2_rad - @lat1_rad) / 2) ** 2 + Math.cos(@lat1_rad) * Math.cos(@lat2_rad) * Math.sin((@lon2_rad - @lon1_rad) / 2) ** 2 
      @c = 2 * Math::atan2(Math::sqrt(@a), Math::sqrt(1 - @a))
      @dis << (@rm * @c).to_i
      @com << c.id
    end
    
    @dis = @dis.sort
    @com = @com.sort
    
  end
  

end
