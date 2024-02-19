class PollutionImportJob < ApplicationJob
  queue_as :default

  def perform
    ImportService.new.import_data
  end
end