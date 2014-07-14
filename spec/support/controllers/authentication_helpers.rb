module ControllerHelpers
  
  shared_examples_for 'authenticate user' do |method, action|
    it "should redirect visitors to login page" do
      if method == :get
        get action, url_params
      elsif method == :post
        post action, url_params
      elsif method == :put
        put action, url_params
      elsif method == :delete
        delete action, url_params
      end
      response.should redirect_to new_user_session_path
    end
    it "should not redirect users to login page" do
      sign_in user 
      if method == :get
        get action, url_params
      elsif method == :post
        post action, url_params
      elsif method == :put
        put action, url_params
      elsif method == :delete
        delete action, url_params
      end
      response.should_not redirect_to new_user_session_path
    end
  end

end