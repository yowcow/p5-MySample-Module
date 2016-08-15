package MySample::Module;
use strict;
use warnings;

our $VERSION = 'v0.1.1';

use File::Basename qw(dirname);
use File::Spec;
use Moo;
use strictures 2;
use namespace::clean;

has data => (
    is      => 'ro',
    default => sub {
        my $file = File::Spec->catfile(dirname(__FILE__), qw( Module resources hoge.dat ));
        local $/ = undef;
        open my $fh, '<', $file or die $!;
        binmode $fh, ':utf8';
        <$fh>;
    },
);

1;
