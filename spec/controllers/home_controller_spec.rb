require 'spec_helper'

describe HomeController do 
  render_views

  context 'get :index' do 
    it 'should be loaded successfully if current user is nil' do
      get :index
      expect{
        response.should be_success 
      }
    end
  end

end