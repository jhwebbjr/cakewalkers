require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  # Import number_to_currency helpers
  # Allows for selecting output currency text in assert_select
  include ActionView::Helpers::NumberHelper

  test "should get index" do
    get admin_orders_url
    assert_response :success
  end

  test "should get index second page" do
    4.times { Order.create }
    get admin_orders_url, params: { page: 2, per_page: 2 }
    assert_response :success
    assert_select "td", number_to_currency(Order.last.total)
  end

  test "should get show" do
    get admin_order_url(Order.create)
    assert_response :success
  end
end
