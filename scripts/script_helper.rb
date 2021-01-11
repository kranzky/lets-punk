# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'punk'

def script(name)
  PUNK.init(task: 'script', config: { app: { name: name } }).exec
end
