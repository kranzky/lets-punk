# frozen_string_literal: true

describe 'echo command', type: :feature do
  it 'repeats the input' do
    expect(command_echo('xYzZy')).to eq('xYzZy')
  end

  it 'can convert the input to uppercase' do
    expect(command_echo('xYzZy', upcase: true)).to eq('XYZZY')
  end

  it 'can convert the input to lowercase' do
    expect(command_echo('xYzZy', downcase: true)).to eq('xyzzy')
  end
end
