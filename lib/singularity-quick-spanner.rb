if (defined? Compass)
  require 'singularitygs'
  Compass::Frameworks.register(
    "singularity-quick-spanner",
    :path => "#{File.dirname(__FILE__)}/.."
  )
end

module SingularityQuickSpanner
  VERSION = "0.1.2"
  DATE = "2014-06-24"
end