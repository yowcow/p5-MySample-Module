use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    module_name   => 'MySample::Module',
    license       => 'perl',
    dist_abstract => 'My sample module',
    requires      => {
        'File::Basename'   => 0,
        'File::Spec'       => 0,
        'Moo'              => 0,
        'namespace::clean' => 0,
        'strictures'       => 2,
    },
    build_requires => { 'Test::More' => 0, },
    dist_author    => 'Yoko OYAMA <yowcow@cpan.org>',
);

$build->add_build_element('dat');

$build->create_build_script;
