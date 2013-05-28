require 'test_helper'

class ObjectivesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should create objective" do
    assert_difference('Objective.count') do
      post :create,
        objective: {title: "toto", description: "toto"},
        user_id: users(:full).id,
        project_id: projects(:full).id
    end

    assert_redirected_to project_path(assigns(:objective).project)
  end

  test "should done objective" do
    objective = Objective.find(objectives(:full_pending).id)
    assert(!objective.done)
    put :done, id: objective.id
    assert(assigns(:objective).done)
    assert_redirected_to objective_path(assigns(:objective))
  end

end
