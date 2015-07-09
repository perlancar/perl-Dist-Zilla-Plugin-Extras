package Dist::Zilla::Plugin::Extras;

# DATE
# VERSION

use Moose;
with 'Dist::Zilla::Role::Plugin';

use namespace::autoclean;

has params => (
    is => 'ro',
    default => sub { {} },
);

sub BUILDARGS {
    my ($class, @arg) = @_;
    my %copy = ref $arg[0] ? %{$arg[0]} : @arg;

    my $zilla = delete $copy{zilla};
    my $name  = delete $copy{plugin_name};

    return {
        zilla => $zilla,
        plugin_name => $name,
        params => \%copy,
    };
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: Put extra parameters in dist.ini

=head1 SYNOPSIS

In your F<dist.ini>:

  [Extras]
  foo = 1
  bar = 2

  [Extras / Baz]
  qux = 1
  quux = 2


=head1 DESCRIPTION

This plugin lets you specify extra parameters in your F<dist.ini> under the
C<[Extras]> section. Other than that it does nothing. It basically serves as
"bags" to put parameters in.

One use-case of this is to put template variables in your F<dist.ini>, e.g.:

 [Extras]
 name1 = value1
 name2 = value2

The parameters are available for other plugins through C<$zilla> (Dist::Zilla
object), e.g.:

 my $extras_plugin = $zilla->plugin_named('Extras');
 my $name1 = $extras_plugin->params->{name1}; # -> "value1"

Another use-case of this is to put stuffs to be processed by other software
aside from L<Dist::Zilla> (e.g. see L<App::LintPrereqs>).


=head1 ATTRIBUTES

=head2 params => hash


=head1 SEE ALSO

L<Dist::Zilla>
