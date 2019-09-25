require 'rails_helper'

describe MonitoringController do
  describe 'GET index' do
    it 'ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end