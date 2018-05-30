require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @notification = notifications(:one)
  end

  test "should get index" do
    skip "need to figure out notifications requirements"
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should get new" do
    skip "need to figure out notifications requirements"
    get :new
    assert_response :success
  end

  test "should create notification" do
    skip "need to figure out notifications requirements"
    assert_difference('Notification.count') do
      post :create, notification: { content: @notification.content, title: @notification.title }
    end

    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should show notification" do
    skip "need to figure out notifications requirements"
    get :show, id: @notification
    assert_response :success
  end

  test "should get edit" do
    skip "need to figure out notifications requirements"
    get :edit, id: @notification
    assert_response :success
  end

  test "should update notification" do
    skip "need to figure out notifications requirements"
    patch :update, id: @notification, notification: { content: @notification.content, title: @notification.title }
    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should destroy notification" do
    skip "need to figure out notifications requirements"
    assert_difference('Notification.count', -1) do
      delete :destroy, id: @notification
    end

    assert_redirected_to notifications_path
  end
end
