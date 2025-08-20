require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:valid_attributes) { { description: "Test Task" } }
  let(:invalid_attributes) { { description: nil } }

  describe "GET #index" do
    it "returns a success response" do
      Task.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Task" do
      expect {
        post :create, params: { task: valid_attributes }
      }.to change(Task, :count).by(1)
    end
    it "does not create a new Task with invalid attributes" do
      expect {
        post :create, params: { task: invalid_attributes }
      }.not_to change(Task, :count)
    end
  end
end
