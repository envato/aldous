RSpec.describe Aldous::Controller::Action::ResultExecutionService do
  let(:result_execution_service) {described_class.new(controller, respondable, default_view_data)}

  let(:controller) {double "controller", view_context: view_context}

  let(:view_context) {double "view_context"}

  let(:respondable) do
    double "respondable", {
      action: action
    }
  end

  let(:default_view_data) { {hello: 'world'} }

  let(:action) {double 'action', execute: nil}

  describe "::perform" do
    subject(:perform) {described_class.perform(controller, respondable, default_view_data)}

    let(:result_execution_service) {double "result_execution_service", perform: nil}

    before do
      allow(described_class).to receive(:new).and_return(result_execution_service)
    end

    it "instantiates the result execution service" do
      expect(described_class).to receive(:new).with(controller, respondable, default_view_data)
      perform
    end

    it "performs the result execution service" do
      expect(result_execution_service).to receive(:perform)
      perform
    end
  end

  describe "#perform" do
    subject(:perform) {result_execution_service.perform}

    it "fetches the action from the complete respondable" do
      expect(respondable).to receive(:action).with(controller)
      perform
    end

    it "executes the complete respondable action" do
      expect(action).to receive(:execute)
      perform
    end
  end
end
