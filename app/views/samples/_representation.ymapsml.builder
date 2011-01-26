repr.style "waterStyle", :parent => "default#bluePoint" do
  repr.balloon_content :template => "sampleTemplate"
end
repr.style "soilStyle", :parent => "default#redPoint" do
  repr.balloon_content :template => "sampleTemplate"
end
repr.template "sampleTemplate" do
  render :partial => "sample_template.html.haml"
end