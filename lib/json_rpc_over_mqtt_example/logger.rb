require 'logger'

def logger
  @log ||= Logger.new(STDOUT)
  @log.level = Logger::INFO
  @log
end
