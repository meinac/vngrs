require 'spec_helper'

describe ContactsController do 
  render_views

  before(:all) do
    @user = FactoryGirl.create(:user)
    @contact = FactoryGirl.create(:contact, user: @user)
  end

  context 'authentication tests' do
    it_behaves_like 'authenticate user', :get, :index do 
      let(:user) { @user }
      let(:url_params) { nil } 
    end
    it_behaves_like 'authenticate user', :get, :new do 
      let(:user) { @user }
      let(:url_params) { nil } 
    end
    it_behaves_like 'authenticate user', :get, :edit do 
      let(:user) { @user }
      let(:url_params) { { id: @contact.id } } 
    end
    it_behaves_like 'authenticate user', :post, :create do 
      let(:user) { @user }
      let(:url_params) { { contact: { name: "Mehmet Emin" } } } 
    end
    it_behaves_like 'authenticate user', :patch, :update do 
      let(:user) { @user }
      let(:url_params) { { id: @contact.id, contact: { name: "Mehmet Emin" } } } 
    end
  end

end