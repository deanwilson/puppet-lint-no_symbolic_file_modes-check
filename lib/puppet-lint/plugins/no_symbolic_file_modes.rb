NO_SYMBOLIC_FILE_MODES_IGNORE_TYPES = Set[:VARIABLE, :UNDEF].freeze
WARNING = 'mode should be a 4 digit octal value, not a symbolic mode'.freeze

PuppetLint.new_check(:no_symbolic_file_modes) do
  def check
    resource_indexes.each do |resource|
      next unless resource[:type].value == 'file'

      param_tokens = resource[:param_tokens].select { |pt| pt.value == 'mode' }

      param_tokens.each do |param_token|
        value_token = param_token.next_code_token.next_code_token

        break if NO_SYMBOLIC_FILE_MODES_IGNORE_TYPES.include?(value_token.type)
        break if value_token.value =~ /^[0-7]{4}$/

        notify :warning, {
          message: WARNING,
          line:    value_token.line,
          column:  value_token.column,
          token:   value_token,
        }
      end
    end
  end
end
