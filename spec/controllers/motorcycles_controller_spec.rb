require 'rails_helper'

describe MotorcyclesController do
  let(:motorcycle) {FactoryGirl.create(:motorcycle)}
  
  describe 'GET #index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template("index")
    end

    it "returns a list of motorcycles" do
      moto1 = FactoryGirl.create(:motorcycle)
      moto2 = FactoryGirl.create(:motorcycle)
      get :index

      expect(response).to be_success
      expect(assigns(:motorcycles)).to eq([moto1, moto2])
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, id: motorcycle

      response.should render_template :show
    end

    it 'returns the requested @motorcycle' do
      get :show, id: motorcycle
      
      assigns(:motorcycle).should eq(motorcycle)
    end
  end

  describe 'POST #create' do
    it 'creates a new motorcycle' do
      expect{
        post :create, motorcycle: FactoryGirl.attributes_for(:motorcycle)
      }.to change(Motorcycle, :count).by(1)
    end
  end

end
