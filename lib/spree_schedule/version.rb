module SpreeSchedule
  VERSION = '0.0.12'.freeze

  module_function

  # Returns the version of the currently loaded SpreeSchedule as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION
  end
end
