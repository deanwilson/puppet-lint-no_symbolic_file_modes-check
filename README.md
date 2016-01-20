# puppet-lint no symbolic file modes check

Extends puppet-lint to ensure all file resource modes are defined as octal
values and not symbolic ones.

While symbolic modes can be more flexible than numeric modes they allow
you to become less absolute about the permissions a file will end up
with. `mode => 'ug+w'` for example will set the user and group write
bits, without affecting any other bits, leaving you unable to determine
the files final permissions from just reading the puppet code.

    # a good, octal mode.
    class octal_file_mode {
      file { '/tmp/octal-mode':
        mode => '0600',
      }
    }

    # A bad, symbolic mode.
    class symbolic_file_mode {
      file { '/tmp/symbolic-mode':
        mode => 'ug=rw,o=rx',
      }
    }

## Installation

To use this plugin add the following line to your Gemfile

    gem 'puppet-lint-no_symbolic_file_modes-check'

and then run `bundle install`.

## Usage

This plugin provides a new check to `puppet-lint`.

    mode should be a 4 digit octal value, not a symbolic mode

## Notes

The code for this was heavily borrowed/stolen from the original,
including in puppet-lint, file mode check written by @rodjek
