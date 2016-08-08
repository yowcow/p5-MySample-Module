use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    module_name => 'MySample::Module',
    license => 'perl',
    dist_abstract => 'My sample module',
    requires => {
        'Moo' => 0,
    },
    author => 'dataSpring, Inc.',
);

$build->create_build_script;
