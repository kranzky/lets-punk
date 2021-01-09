# frozen_string_literal: true

describe Status do
  let(:message) do
    Faker::TvShows::Seinfeld.quote
  end

  it 'is valid with valid attributes' do
    view = described_class.present(message: message)
    expect(view.to_h[:message]).to eq(message)
  end

  it 'is invalid without a message' do
    view = described_class.run
    expect(view.status).to eq(400)
    expect(view.to_h[:errors]).to include('message is not present')
  end

  context 'when rendering the template' do
    let(:view) { described_class.run(message: message) }

    it 'supports json' do
      expect { view.render(:json) }.not_to raise_error
    end

    it 'does not support html' do
      expect { view.render(:html) }.to raise_error(PUNK::NotFound)
    end

    it 'does not support csv' do
      expect { view.render(:csv) }.to raise_error(PUNK::NotFound)
    end

    it 'does not support xml' do
      expect { view.render(:xml) }.to raise_error(PUNK::NotFound)
    end
  end
end
