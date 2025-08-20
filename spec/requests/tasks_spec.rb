require 'rails_helper'

RSpec.describe "/tasks", type: :request do
  let(:valid_attributes) {
    { description: "This is a sample task.", completed: false }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Task.create! valid_attributes
      get tasks_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "creates a new Task" do
      expect {
        post tasks_url, params: { task: valid_attributes }
      }.to change(Task, :count).by(1)
    end
  end

  describe "PATCH /update" do
    let!(:task) { Task.create!(description: "Old task", completed: false) }
    let(:new_attributes) {
      { description: "This is an updated task.", completed: true }
    }

    it "updates the requested task" do
      patch task_url(task), params: { task: new_attributes }
      task.reload
      expect(task.description).to eq("This is an updated task.")
      expect(task.completed).to eq(true)
    end
  end

  describe "DELETE /destroy" do
    let!(:task) { Task.create!(description: "Delete me", completed: false) }

    it "destroys the requested task" do
      expect {
        delete task_url(task)
      }.to change(Task, :count).by(-1)
    end
  end
end
