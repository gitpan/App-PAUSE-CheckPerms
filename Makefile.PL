
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "check if PAUSE permissions are consistent for all modules in a dist",
  "AUTHOR" => "Neil Bowers <neil\@bowers.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-PAUSE-CheckPerms",
  "EXE_FILES" => [
    "bin/pause-checkperms"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::PAUSE::CheckPerms",
  "PREREQ_PM" => {
    "Moo" => 0,
    "MooX::Options" => 0,
    "PAUSE::Packages" => "0.02",
    "PAUSE::Permissions" => "0.06",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.88"
  },
  "VERSION" => "0.03",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Moo" => 0,
  "MooX::Options" => 0,
  "PAUSE::Packages" => "0.02",
  "PAUSE::Permissions" => "0.06",
  "Test::More" => "0.88",
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



