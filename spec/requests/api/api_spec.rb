require 'swagger_helper'

RSpec.describe 'api/api', type: :request do
  path '/api/users/{user_id}/posts/{post_id}/comments' do
    parameter name: :user_id, in: :path, type: :integer, required: true
    parameter name: :post_id, in: :path, type: :integer, required: true

    post 'Creates a comment for a post' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:user_id) { 1 } # Replace with a valid user ID
        let(:post_id) { 1 } # Replace with a valid post ID
        let(:comment) { { text: 'This is a new comment' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { 1 } # Replace with a valid user ID
        let(:post_id) { 1 } # Replace with a valid post ID
        let(:comment) { { text: '' } }
        run_test!
      end
    end

    get 'Retrieves comments for a post' do
      tags 'Comments'
      produces 'application/json'

      response '200', 'comments found' do
        let(:user_id) { 1 } # Replace with a valid user ID
        let(:post_id) { 1 } # Replace with a valid post ID
        run_test!
      end

      response '404', 'post not found' do
        let(:user_id) { 1 } # Replace with a valid user ID
        let(:post_id) { 'invalid' }
        run_test!
      end
    end
  end
end
