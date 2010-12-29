# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{veritas-sql-compiler}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Kubb"]
  s.date = %q{2010-12-28}
  s.description = %q{Generate SQL from a veritas relation}
  s.email = %q{dan.kubb@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "config/flay.yml",
     "config/flog.yml",
     "config/roodi.yml",
     "config/site.reek",
     "config/yardstick.yml",
     "lib/veritas/base_relation.rb",
     "lib/veritas/sql/compiler.rb",
     "lib/veritas/sql/compiler/generator.rb",
     "lib/veritas/sql/compiler/version.rb",
     "spec/rcov.opts",
     "spec/shared/command_method_behavior.rb",
     "spec/shared/idempotent_method_behavior.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/unit/veritas/base_relation/name_spec.rb",
     "spec/unit/veritas/sql/compiler/generator/class_methods/handler_for_spec.rb",
     "spec/unit/veritas/sql/compiler/generator/to_sql_spec.rb",
     "spec/unit/veritas/sql/compiler/generator/visit_spec.rb",
     "tasks/ci.rake",
     "tasks/clean.rake",
     "tasks/quality/flay.rake",
     "tasks/quality/flog.rake",
     "tasks/quality/heckle.rake",
     "tasks/quality/metric_fu.rake",
     "tasks/quality/reek.rake",
     "tasks/quality/roodi.rake",
     "tasks/quality/yardstick.rake",
     "tasks/spec.rake",
     "tasks/yard.rake",
     "veritas-sql-compiler.gemspec"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{https://github.com/dkubb/veritas-sql-compiler}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby Relational Algebra to SQL}
  s.test_files = [
    "spec/shared/command_method_behavior.rb",
     "spec/shared/idempotent_method_behavior.rb",
     "spec/spec_helper.rb",
     "spec/unit/veritas/base_relation/name_spec.rb",
     "spec/unit/veritas/sql/compiler/generator/class_methods/handler_for_spec.rb",
     "spec/unit/veritas/sql/compiler/generator/to_sql_spec.rb",
     "spec/unit/veritas/sql/compiler/generator/visit_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<veritas>, ["= 0.0.2"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.1"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.4.0"])
      s.add_development_dependency(%q<backports>, ["~> 1.18.2"])
    else
      s.add_dependency(%q<veritas>, ["= 0.0.2"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<rspec>, ["~> 1.3.1"])
      s.add_dependency(%q<jeweler>, ["~> 1.4.0"])
      s.add_dependency(%q<backports>, ["~> 1.18.2"])
    end
  else
    s.add_dependency(%q<veritas>, ["= 0.0.2"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<rspec>, ["~> 1.3.1"])
    s.add_dependency(%q<jeweler>, ["~> 1.4.0"])
    s.add_dependency(%q<backports>, ["~> 1.18.2"])
  end
end

