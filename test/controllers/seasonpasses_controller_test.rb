require 'test_helper'

class SeasonpassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seasonpass = seasonpasses(:one)
  end

  test "should get index" do
    get seasonpasses_url
    assert_response :success
  end

  test "should get new" do
    get new_seasonpass_url
    assert_response :success
  end

  test "should create seasonpass" do
    assert_difference('Seasonpass.count') do
      post seasonpasses_url, params: { seasonpass: { club_id: @seasonpass.club_id, user_id: @seasonpass.user_id } }
    end

    assert_redirected_to seasonpass_url(Seasonpass.last)
  end

  test "should show seasonpass" do
    get seasonpass_url(@seasonpass)
    assert_response :success
  end

  test "should get edit" do
    get edit_seasonpass_url(@seasonpass)
    assert_response :success
  end

  test "should update seasonpass" do
    patch seasonpass_url(@seasonpass), params: { seasonpass: { club_id: @seasonpass.club_id, user_id: @seasonpass.user_id } }
    assert_redirected_to seasonpass_url(@seasonpass)
  end

  test "should destroy seasonpass" do
    assert_difference('Seasonpass.count', -1) do
      delete seasonpass_url(@seasonpass)
    end

    assert_redirected_to seasonpasses_url
  end
end
