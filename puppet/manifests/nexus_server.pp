class codedeploy::nexus_server(
$version,
$revision,
$root_path,
){

  validate_re($version,'^.+$')
  validate_re($revision,'^.+$')
  validate_absolute_path($root_path)

  class{ '::nexus':
    version    => $version,
    revision   => $revision,
    nexus_root => $root_path, # All directories and files will be relative to this
  }

}
