require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { admin_user: @task.admin_user, anexo: @task.anexo, codigo: @task.codigo, contador: @task.contador, contador_seg: @task.contador_seg, costo: @task.costo, cumplio: @task.cumplio, employed_id: @task.employed_id, estado: @task.estado, f_compromiso: @task.f_compromiso, f_real: @task.f_real, name: @task.name, observacion: @task.observacion, report_id: @task.report_id, user_id: @task.user_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { admin_user: @task.admin_user, anexo: @task.anexo, codigo: @task.codigo, contador: @task.contador, contador_seg: @task.contador_seg, costo: @task.costo, cumplio: @task.cumplio, employed_id: @task.employed_id, estado: @task.estado, f_compromiso: @task.f_compromiso, f_real: @task.f_real, name: @task.name, observacion: @task.observacion, report_id: @task.report_id, user_id: @task.user_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
