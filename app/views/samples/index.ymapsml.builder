ymapsml do |xml|
  xml.representation do |repr|
    render :partial => "representation", :locals => { :repr => repr }
  end
  xml.collection do
    @samples.each do |sample|
      xml.object sample, :style => "#{sample.kind}Style" do |o|
        o.description sample.description
        o.meta_data do |md|
          md.sampleId sample.id
          md.path sample_path(sample)
        end
      end
    end
  end
end