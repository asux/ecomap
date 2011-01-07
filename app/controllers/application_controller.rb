class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization

  before_filter :get_version_info

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  def get_version_info
    revision_filename = Rails.root.join('REVISION')
    @version_info = Hash.new
    if File.file?(revision_filename)
      release = File.basename(Rails.root)
      revision = File.open(revision_filename, 'r').read.strip
      git_bin = "git"
      commit = %x[#{git_bin} --work-tree #{Rails.root} log --format=oneline -n 1 #{revision}]
      #@version_info[:revision] = %Q[<a href="http://redmine.dikins.org.ua/projects/gramota/repository/revisions/#{revision}" class="revision">#{revision}</a>]
      @version_info[:commit] = %Q[<a href="https://github.com/asux/ecomap/commit/#{revision}" class="revision">#{commit}</a>]
      @version_info[:release] = release
    end
  end

end
