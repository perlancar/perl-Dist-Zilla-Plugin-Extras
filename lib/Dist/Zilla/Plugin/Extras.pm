package Dist::Zilla::Plugin::Extras;
use Moose;
with 'Dist::Zilla::Role::Plugin';

# VERSION

use namespace::autoclean;

sub BUILDARGS {
    my ($class, @arg) = @_;
    my %copy = ref $arg[0] ? %{$arg[0]} : @arg;

    my $zilla = delete $copy{zilla};
    my $name  = delete $copy{plugin_name};

    return {
        zilla => $zilla,
        plugin_name => $name,
    }
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: Put and ignore extra parameters in dist.ini

=head1 SYNOPSIS

In your F<dist.ini>:

  [Extras]
  foo = 1
  bar = 2

  [Extras / Baz]
  qux = 1
  quux = 2


=head1 DESCRIPTION

This plugin lets you specify extra parameters in your dist.ini under the
[Extras] section. It does nothing. One use-case of this is to put stuffs to be
processed by other software aside from Dist::Zilla.


=head1 SEE ALSO

L<Dist::Zilla>
