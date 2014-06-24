# -*- encoding: utf-8 -*-
require './lib/singularity-quick-spanner'

Gem::Specification.new do |s|
  # General Project Information
  s.name = "singularity-quick-spanner"
  s.version = SingularityQuickSpanner::VERSION
  s.date = SingularityQuickSpanner::DATE
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")

  # Author Information
  s.authors = ["lolmaus (Andrey Mikhaylov)"]
  s.email = ["lolmaus@gmail.com"]
  s.homepage = "https://github.com/lolmaus/singularity-quick-spanner"

  # Project Description
  s.description = "A collection of handy shortcut mixins for the Singularity grid system"
  s.summary = "Saves you some hassle for: working with multiple grid definitions on the same page; spanning a symmetrical thumbnail grid; spanning a responsive symmetrical thumbnail grid."

  # Files to Include
  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  # Dependent Gems
  s.add_dependency 'sass',                ">= 3.3.0"
  s.add_dependency 'singularitygs',       ">= 1.2.1"
  s.add_dependency 'breakpoint',          ">= 2.4.2"
  s.add_dependency 'breakpoint-slicer',   ">= 1.3.4"
end