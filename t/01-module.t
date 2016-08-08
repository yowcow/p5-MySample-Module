use strict;
use warnings;
use MySample::Module;
use Test::More;

my $module = MySample::Module->new;

isa_ok $module, 'MySample::Module';
is $module->data, <<END;
hoge
fuga
foo
bar
END

done_testing;
