require 'spec_helper'

describe 'no_symbolic_file_modes' do
  let(:msg) { 'mode should be a 4 digit octal value, not a symbolic mode' }

  context 'when the manifest has no file resources' do
    let(:code) do
      <<-TEST_CLASS
        class no_file_resource {
          host { 'syslog':
            ip => '10.10.10.10',
          }
        }
      TEST_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'when file has an all octal mode' do
    let(:code) do
      <<-TEST_CLASS
        class octal_file_mode {
          file { '/tmp/octal-mode':
            mode => '0600',
          }
        }
      TEST_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'when file has a symbolic mode' do
    let(:code) do
      <<-TEST_CLASS
        class symbolic_file_mode {
          file { '/tmp/symbolic-mode':
            mode => 'ug=rw,o=rx',
          }
        }
      TEST_CLASS
    end

    it 'detects a single problem' do
      expect(problems).to have(1).problem
    end

    it 'creates a warning' do
      expect(problems).to contain_warning(msg).on_line(3).in_column(21)
    end
  end
end
