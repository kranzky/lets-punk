# frozen_string_literal: true

describe PUNK, "GET /status" do
  include_context "Punk"

  context 'when no message is given' do
    before do
      get '/status'
    end

    it { is_expected.not_to be_successful }
    its(:body) { is_expected.to match('message is not present') }
  end

  context 'when a message is given' do
    before do
      get '/status?message=xyzzy'
    end

    it { is_expected.to be_successful }
    its(:body) { is_expected.to match('xyzzy') }
  end
end
