repr.style "waterStyle", :balloon => true do
  repr.parentStyle "default#bluePoint"
  repr.balloon_content :template => "sampleTemplate"
end
repr.style "soilStyle", :balloon => true do
  repr.parentStyle "default#redPoint"
  repr.balloon_content :template => "sampleTemplate"
end
repr.template "sampleTemplate" do
  render :partial => "sample_template.html.haml"
end