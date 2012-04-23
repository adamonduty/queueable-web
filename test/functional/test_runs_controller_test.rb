require 'test_helper'

class TestRunsControllerTest < ActionController::TestCase
  setup do
    @test_run = test_runs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_runs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_run" do
    assert_difference('TestRun.count') do
      post :create, test_run: { machine: @test_run.machine, notes: @test_run.notes, release: @test_run.release, sysname: @test_run.sysname, version: @test_run.version }
    end

    assert_redirected_to test_run_path(assigns(:test_run))
  end

  test "should show test_run" do
    get :show, id: @test_run
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_run
    assert_response :success
  end

  test "should update test_run" do
    put :update, id: @test_run, test_run: { machine: @test_run.machine, notes: @test_run.notes, release: @test_run.release, sysname: @test_run.sysname, version: @test_run.version }
    assert_redirected_to test_run_path(assigns(:test_run))
  end

  test "should destroy test_run" do
    assert_difference('TestRun.count', -1) do
      delete :destroy, id: @test_run
    end

    assert_redirected_to test_runs_path
  end
end
