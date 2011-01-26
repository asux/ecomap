module SamplesHelper
  # def index_ymapsml_url
  #   samples_url(:format => :ymapsml)
  # end
  #
  # def new_ymapsml_url
  #   index_ymapsml_url
  # end
  #
  # def show_ymapsml_url
  #   sample_url(@sample, :format => :ymapsml)
  # end
  #
  # def edit_ymapsml_url
  #   show_ymapsml_url
  # end
  #
  # def ymapsml_url(action_name=nil)
  #   if action_name.nil?
  #     if controller.action_name
  #       action_name = controller.action_name
  #     elsif controller.url_options.has_key?(:action)
  #       action_nane = controller.url_options[:action]
  #     elsif controller.url_options.has_key?(:_path_segments)
  #       action_name = controller.url_options[:_path_segments][:action]
  #     end
  #   end
  #   raise RuntimeError, "Unable determine action name for controller '#{controller_name}'" if action_name.nil?
  #   self.send("#{action_name}_ymapsml_url".to_sym) unless action_name.nil?
  # end
end
