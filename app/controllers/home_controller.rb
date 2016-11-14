class HomeController < ApplicationController
  def index     #홈페이지
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
    @nticket = Nticket.all
    @nticket2 = Nticket.where(:user_id => current_user)
    @nticket2.each do |n|
      @company << Company.where(:id => n.company_id)
    end
    
  end
  
  def mypage2
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
    
  end
  
  def nticket   #대기표뽑는페이지
   
    @nticket = Nticket.all
    ntic = Nticket.new
    ntic.user_id = current_user.id
    ntic.company_id = params[:company_id]
    ntic.save
    
    
    redirect_to(request.env['HTTP_REFERER']) 
  end
  
  def post
    @post = Post.all
    @user = current_user
  end
  
  def post_p
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
    
    @nticket = Nticket.where("company_id LIKE ?",params[:company_id])
    @sort = Csort.where(:id=> @company_p.csort_id)[0]
  end
  
  def nticket_d
    @user = User.all
    @nticket = Nticket.all
    @company = Company.all
    @company2 = params[:company_id]
    @nticket = params[:check_ids]
    @nticket2 = Nticket.where("company_id LIKE ?",@company2)
    @nticket.each do |n|
      @nticket3 = @nticket2.where("user_id LIKE ?",n).destroy_all
    end
    
    
    redirect_to(request.env['HTTP_REFERER'])
  end
  
  def nticket_cancel
    @nticket = params[:nticket_val]
    Nticket.where(:company_id => @nticket, :user_id => current_user).destroy_all
    redirect_to(request.env['HTTP_REFERER'])   
  end
  
  def admin
    @user = User.all
    @company = Company.all
    
  end
  
  def search
    @search = params[:search]
    
    @search2 = Company.where("name LIKE?","%#{@search}%")
  end

end
