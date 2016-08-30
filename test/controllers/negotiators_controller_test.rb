require 'test_helper'

class NegotiatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @negotiator = negotiators(:one)
  end

  test "should get index" do
    get negotiators_url
    assert_response :success
  end

  test "should get new" do
    get new_negotiator_url
    assert_response :success
  end

  test "should create negotiator" do
    assert_difference('Negotiator.count') do
      post negotiators_url, params: { negotiator: {  } }
    end

    assert_redirected_to negotiator_url(Negotiator.last)
  end

  test "should show negotiator" do
    get negotiator_url(@negotiator)
    assert_response :success
  end

  test "should get edit" do
    get edit_negotiator_url(@negotiator)
    assert_response :success
  end

  test "should update negotiator" do
    patch negotiator_url(@negotiator), params: { negotiator: {  } }
    assert_redirected_to negotiator_url(@negotiator)
  end

  test "should destroy negotiator" do
    assert_difference('Negotiator.count', -1) do
      delete negotiator_url(@negotiator)
    end

    assert_redirected_to negotiators_url
  end
end
