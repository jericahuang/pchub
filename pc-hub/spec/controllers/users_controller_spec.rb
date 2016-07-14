require 'spec_helper'

describe 'UsersController' do
	describe 'POST #create' do
  	context 'with valid credentials' do
    	it 'creates user and logs in' do
      #	user = create(:user)
      	post :create, user: attributes_for(:user)
				expect(controller.current_user).to eq user
			end

			it 'redirects to the "show" action for the new user' do
				post :create, user: attributes_for(:user)
		    expect(response).to render_template(:show) #was :new before
			end
    end

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

  #context 'when password is valid' do
    #it 'sets the user in the session and redirects them to their dashboard' do
      #user = create(:user)

     # post :create, session: { email: user.email, password: user.password }

     # expect(response).to redirect_to '/dashboard'
     # expect(controller.current_user).to eq user
    #end
  end
end
