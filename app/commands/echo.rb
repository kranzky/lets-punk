# frozen_string_literal: true

PUNK::Command.create "echo" do
  shortcut "e"
  description "Echo the input: echo [ARGS]"

  option shortcut: :u, name: :upcase, description: "Upper-case the arguments before echoing", type: nil
  option shortcut: :d, name: :downcase, description: "Lower-case the arguments before echoing", type: nil

  def process
    string = args.join(" ")
    string.upcase! if opts[:upcase]
    string.downcase! if opts[:downcase]
    string
  end
end
