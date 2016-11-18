class ApiController <  ApplicationController
    respond_to :json
    def signin
        render :status =>200,
                :json => { :success => params }
    end
end