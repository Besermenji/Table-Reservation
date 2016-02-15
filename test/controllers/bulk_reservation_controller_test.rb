require 'test_helper'

class BulkReservationControllerTest < ActionController::TestCase
  test "should get bulk_reserve" do
    get :bulk_reserve
    assert_response :success
  end

end
