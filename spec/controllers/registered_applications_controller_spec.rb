require 'rails_helper'
include RandomData

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_registered_application) { create(:registered_application) }


  before do
    sign_in(my_user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns my_registered_application to @registered_applications" do
      get :index
      expect(assigns(:registered_applications)).to eq([my_registered_application])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_registered_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_registered_application.id }
      expect(response).to render_template :show
    end

    it "assigns my_registered_application to @registered_applications" do
      get :show, params: { id: my_registered_application.id }
      expect(assigns(:registered_application)).to eq(my_registered_application)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @registered_application" do
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of registered_applications by 1" do
      expect { post :create, params: { registered_application: { name: RandomData.random_word, url: RandomData.random_url } } }.to change(RegisteredApplication, :count).by(1)
    end

    it "assigns the new registered_application to @registered_application" do
      post :create, params: { registered_application: { name: RandomData.random_word, url: RandomData.random_url } }
      expect(assigns(:registered_application)).to eq RegisteredApplication.last
    end

    it "redirects to the new registered_application" do
      post :create, params: { registered_application: { name: RandomData.random_word, url: RandomData.random_url } }
      expect(response).to redirect_to RegisteredApplication.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: my_registered_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { id: my_registered_application.id }
      expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @registered_application" do
      get :edit, params: { id: my_registered_application.id }
      registered_application_instance = assigns(:registered_application)

      expect(registered_application_instance.id).to eq my_registered_application.id
      expect(registered_application_instance.name).to eq my_registered_application.name
      expect(registered_application_instance.url).to eq my_registered_application.url
    end
  end

  describe "PUT #update" do
    it "updates registered_application with expected attributes" do
      new_name = RandomData.random_word
      new_url = RandomData.random_url

      put :update, params: { id: my_registered_application.id, registered_application: { name: new_name, url: new_url } }

      updated_registered_application = assigns(:registered_application)
      expect(updated_registered_application.id).to eq my_registered_application.id
      expect(updated_registered_application.name).to eq new_name
      expect(updated_registered_application.url).to eq new_url
    end

    it "redirects to the updated registered_application" do
      new_name = RandomData.random_word
      new_url = RandomData.random_url

      put :update, params: { id: my_registered_application.id, registered_application: { name: new_name, url: new_url } }
      expect(response).to redirect_to my_registered_application
    end
  end

  describe "GET #destroy" do
    it "deletes the registered_application" do
      delete :destroy, params: { id: my_registered_application.id }
      count = RegisteredApplication.where({id: my_registered_application.id}).size
      expect(count).to eq 0
    end

    it "redirects to registered_application index" do
      delete :destroy, params: { id: my_registered_application.id }
      expect(response).to redirect_to registered_applications_path
    end
  end

end
