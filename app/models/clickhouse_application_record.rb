class ClickhouseApplicationRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: :clickhouse

  # https://clickhouse.com/docs/en/sql-reference/statements/optimize
  def self.optimize_final
    connection.execute("OPTIMIZE TABLE #{table_name} FINAL")
  end

  def self.optimize!
    connection.execute("OPTIMIZE TABLE #{table_name}")
  end
end
