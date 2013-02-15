
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "WebScraping pseudo-API for iDoneThis",
  "AUTHOR" => "Paul Fenwick <pjf\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Test::Exception" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "WebService-Idonethis",
  "EXE_FILES" => [
    "bin/idone",
    "bin/idonethis-memories"
  ],
  "LICENSE" => "perl",
  "NAME" => "WebService::Idonethis",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Config::Tiny" => 0,
    "File::Spec" => 0,
    "File::XDG" => 0,
    "Getopt::Std" => 0,
    "HTTP::Cookies" => 0,
    "HTTP::Request" => 0,
    "JSON::Any" => 0,
    "LWP::Protocol::https" => 0,
    "Moo" => 0,
    "POSIX" => 0,
    "Try::Tiny" => 0,
    "WWW::Mechanize" => 0,
    "autodie" => 0,
    "constant" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.06",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);


