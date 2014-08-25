require 'redmine'
# require 'html5_fields/projects_helper_patch'

if Redmine::VERSION.to_s >= "2.5"
  require 'html5_fields/field_format'
else
  # FIXME: supports for Redmine 2.4 or lower
end

Redmine::Plugin.register :redmine_html5_fields do
  name 'Redmine Html5 Fields plugin'
  author 'Takumi Endo'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/tq-jappy/redmine_html5_fields'
  author_url 'http://github.com/tq-jappy'

  requires_redmine :version_or_higher => '2.5'

  Rails.configuration.to_prepare do
    # require_dependency 'projects_helper'
    # unless ProjectsHelper.included_modules.include? Html5Fields::ProjectsHelperPatch
    #   ProjectsHelper.send(:include, Html5Fields::ProjectsHelperPatch)
    # end
  end
end
