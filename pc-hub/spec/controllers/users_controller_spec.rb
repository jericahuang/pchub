=begin
This file tests the creation of a user with valid and invalid credentials.
=end

require 'spec_helper'

describe 'UsersController' do
  describe 'POST #create' do
    
    #create new user - valid credentials.
    context 'with valid credentials' do
      it 'creates user and logs in' do
        
  	post :create, user: attributes_for(:user)
	expect(controller.current_user).to eq user
      end

      it 'redirects to the "show" action for the new user' do
	post :create, user: attributes_for(:user)
	expect(response).to render_template(:show) #was :new before
      end
    end

    #create new user - invalid credentials. 
    context 'with invalid credentials' do
      it 'does not create a new user' do
	post :create, user: attributes_for(:user, password: 'invalid')
	expect(User.count).to eq(0)
      end

      it 'redirects to the "new" view' do
	post :create, user: attributes_for(:user, password: 'invalid')
	expect(response).to render_template :new
      end
    end
  end
end
