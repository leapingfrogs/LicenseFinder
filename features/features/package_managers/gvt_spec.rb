require_relative '../../support/feature_helper'

describe 'Gvt Dependencies' do
  let(:go_developer) { LicenseFinder::TestingDSL::User.new }

  specify 'are shown in reports for a project' do
    project = LicenseFinder::TestingDSL::GvtProject.create
    ENV['GOPATH'] = "#{project.project_dir}/gopath_gvt"

    go_developer.run_license_finder('gopath_gvt/src')
    expect(go_developer).to be_seeing_line 'github.com/aws/aws-sdk-go, ea4ed6c6aec305f9c990547f16141b3591493516, "Apache 2.0"'
    expect(go_developer).to be_seeing_line 'github.com/go-sql-driver/mysql, 2e00b5cd70399450106cec6431c2e2ce3cae5034, "Mozilla Public License 2.0"'
  end
end

