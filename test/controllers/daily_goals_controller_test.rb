require 'test_helper'

class DailyGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_goal = daily_goals(:one)
  end

  test "should get index" do
    get daily_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_goal_url
    assert_response :success
  end

  test "should create daily_goal" do
    assert_difference('DailyGoal.count') do
      post daily_goals_url, params: { daily_goal: { currently_date: @daily_goal.currently_date, goal_id: @daily_goal.goal_id, user_id: @daily_goal.user_id, value: @daily_goal.value } }
    end

    assert_redirected_to daily_goal_url(DailyGoal.last)
  end

  test "should show daily_goal" do
    get daily_goal_url(@daily_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_goal_url(@daily_goal)
    assert_response :success
  end

  test "should update daily_goal" do
    patch daily_goal_url(@daily_goal), params: { daily_goal: { currently_date: @daily_goal.currently_date, goal_id: @daily_goal.goal_id, user_id: @daily_goal.user_id, value: @daily_goal.value } }
    assert_redirected_to daily_goal_url(@daily_goal)
  end

  test "should destroy daily_goal" do
    assert_difference('DailyGoal.count', -1) do
      delete daily_goal_url(@daily_goal)
    end

    assert_redirected_to daily_goals_url
  end
end
