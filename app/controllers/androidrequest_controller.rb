require 'json' 

class AndroidrequestController < ApplicationController


    def login_request
          print("로그인 요청")
          
          @email = params[:email] # 넘어온 데이터를 받는다
          @pw = params[:pw]
          
          
          @user = User.find_by_email(@email) # db를 조회한다
          # 여기서 User는 제 프로그램의 사용자 데이터를 가진 모델입니다.
    
          if @user !=nil # 조회된 데이터가 있으면
             @passwrod_check = @user.valid_password?(@pw) # 맞는 패스워드인지 확인
             if @passwrod_check == true # 맞다면
               render json: @user #해당 데이터를 json으로 출력    
            else
                render 'null' # 아니라면 null 출력
            end
          else
            render 'null' # 아이디가 존재하지 않는다면 null 출력
          end
          
    end
    
    def sort_request
        print("sort페이지요청")
        @sort_id = params[:sort_id]
        @sort = Csort.find_by_id(@sort_id)  #회사조회
        
        if @sort != nil 
            @company = Company.where(:csort_id => @sort_id)
           render json: @company
        else 
            render 'null'
        end
    end
    
    def get_normaluser_posts
      print("일반 유저 마이페이지")
      @email = params[:email]
      @user = User.find_by_email(@email) # user을 찾아와서 가져온다.
     
      @posts = @user.posts # 이 user에 속한 모든 게시물을 디비에서 가져온다.

      if @posts!=nil # 만약 보드가 존재한다면
          render json: @posts.as_json() # json으로 출력하는데 as_json()을 호출한다.
      else                                                                 
          render 'null'
      end
    end
    
    def company_request
        print("업체페이지요청")
        @cname = params[:name]
        @cname2 = Company.find_by_name(@cname)
        
        if @cname2 != nil
            @cname3 = Company.where(:name => @cname)
            render json: @cname2 
        else
            render 'null'
        end
    end
    
    def nticket_request
        print("번호표뽑기요청")
        @user_id = params[:user_id]
        @company_id = params[:company_id]
        
        ntic = Nticket.new
        ntic.user_id = @user_id
        ntic.company_id = @company_id
        @nticketmax = Company.where(:id => @company_id)[0].nticket_max
        ntic.ticketnumber = @nticketmax
        ntic.save
        
        company = Company.where(:id => params[:company_id])[0]
        company.nticket_max = @nticketmax+1
        company.save
        
        
        @nticket = Nticket.where(:user_id => @user_id, :company_id => @company_id)
        @length = @nticket.length
        @nticket2 = @nticket[@length-1]
        render json: @nticket2
    
    end
    
    def reserve_request
        
        @user_id = params[:user_id]
        @company_id = params[:company_id]
        @reserve_time = params[:reserve_time]
        @reserve_date = params[:reserve_date]
        @requestmenu = params[:requestmenu]
        @person_num = params[:person_num]
        
        reserve = Reservation.new
        reserve.user_id = @user_id
        reserve.company_id = @company_id
        reserve.reserve_time = @reserve_time
        reserve.reserve_date = @reserve_date
        reserve.person_num = @person_num
        reserve.requestmenu = @requestmenu
        reserve.save
        
        @reserve = Reservation.where(:user_id => @user_id, :company_id => @company_id)
        @length = @reserve.length
        @reserve2 = @reserve[@length-1]
        render json: @reserve2
        
    
    end
    
    def mypage_request_nticket
        @user_id = params[:user_id]
        
        @nticket = Nticket.where(:user_id => @user_id)
        
        render json: @nticket
        
    end
    
    def mypage_request_reservation
        
        @user_id = params[:user_id]
        
        @reservation = Reservation.where(:user_id=>@reservation)
        
        render json: @reservation
    
    end
    
    def signup_request
        @user_email = params[:sign_email]
        @user_password = params[:sign_password]
        @user_name = params[:sign_name]
        @user_phone = params[:sign_phone]
        
        user = User.new
        user.email = @user_email
        user.password = @user_password
        user.name = @user_name
        user.phone = @user_phone
        user.save
        
        @user = User.where(:email => @user_email)[0]
        
        render json: @user
        
        
    end
    
    def nticket_request_company
        @company_id = params[:company_id]
        @company = Company.where(:id => @company_id)[0]
        
        render json: @company
    end
    


end
