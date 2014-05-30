require 'spec_helper' 


describe "df_eclipse::default" do 
  let(:chef_run) { ChefSpec::Runner.new.converge('df_eclipse::default')}
  it "should include my java recipe" do 
  	expect(chef_run).to include_recipe("df_java::default")
  end
  it "should include libarchive" do
  	expect(chef_run).to include_recipe("libarchive")
  end 
end
