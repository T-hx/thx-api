require 'test_helper'

class ThxTxnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thx_txn = thx_txns(:one)
  end

  test "should get index" do
    get thx_txns_url, as: :json
    assert_response :success
  end

  test "should create thx_txn" do
    assert_difference('ThxTxn.count') do
      post thx_txns_url, params: { thx_txn: { comment: @thx_txn.comment, reciever: @thx_txn.reciever, sender: @thx_txn.sender, thx: @thx_txn.thx } }, as: :json
    end

    assert_response 201
  end

  test "should show thx_txn" do
    get thx_txn_url(@thx_txn), as: :json
    assert_response :success
  end

  test "should update thx_txn" do
    patch thx_txn_url(@thx_txn), params: { thx_txn: { comment: @thx_txn.comment, reciever: @thx_txn.reciever, sender: @thx_txn.sender, thx: @thx_txn.thx } }, as: :json
    assert_response 200
  end

  test "should destroy thx_txn" do
    assert_difference('ThxTxn.count', -1) do
      delete thx_txn_url(@thx_txn), as: :json
    end

    assert_response 204
  end
end
