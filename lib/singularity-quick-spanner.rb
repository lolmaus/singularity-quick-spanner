if (defined? Compass)
  require 'singularitygs'
  Compass::Frameworks.register(
    "singularity-quick-spanner",
    :path => "#{File.dirname(__FILE__)}/.."
  )
end

module BreakpointSlicer
  VERSION = "0.1.0"
  DATE = "2014-06-24"
end