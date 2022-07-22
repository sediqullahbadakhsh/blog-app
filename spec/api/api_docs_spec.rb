require 'swagger_helper'
require 'rails_helper'

describe 'API Docs', type: :request do
  before do
    @user = User.create(name: 'Timmy', email: 'tim@mailex.com', password: 'password')
  end

  after do
    Rails.application.reload_routes!
  end

  path '/login' do
    post 'Login' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        }
      }
      response '200', 'Success' do
        let(:user) { { email: @user.email, password: @user.password } }
        run_test!
      end
    end
  end
end
