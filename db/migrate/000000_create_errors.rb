MIGRATION_CLASS =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  else
    ActiveRecord::Migration
  end

class CreateErrors < MIGRATION_CLASS

  # => ATTRS
  require_relative "../../app/models/exception_handler/exception.rb"

  #########################################
  #########################################

    # => Defs
    @@table = ExceptionHandler.config.try(:db)

  #########################################

    # Up
    def up
      create_table @@table, if_not_exists: true do |t|
        ExceptionHandler::ATTRS.each do |attr|
          t.text attr
        end
        t.timestamps
      end
    end

  #########################################

    # Down
    def down
      drop_table @@table, if_exists: true
    end

  #########################################
  #########################################

end
