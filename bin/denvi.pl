#!/usr/bin/env perl

use strict;
use warnings;
use Data::Section::Simple qw(get_data_section);
use utf8;
use Cwd qw( abs_path getcwd );
use Encode;


my @files = qw( .gitignore editorconfig README.md .scss-lint.yml );

sub main {
  my @filelist = (@_) ? @_ : @files;
  my $cwd = abs_path(getcwd());
  for (@filelist){
    &_makeFile($cwd, $_);
  }
}

sub _makeFile {
  my ($cwd, $name) = @_;
  my $data = get_data_section($name);
  my $file = "$cwd/$name";

  die "Can't make. File exists $file.\n" if -e $file;
  open NEWFILE, '>'.$file or die "can't open file. $!\n";
  print NEWFILE encode_utf8($data) or die "can't write file. $!\n";
  close NEWFILE  or die "can't close file. $!\n";
}


main(@ARGV);

__DATA__
@@ .gitignore
# Ignore bundler config
/.bundle

# Ignore cache
.sass-cache
node_modules
.tmp

# Numerous always-ignore extensions
*.diff
*.err
*.orig
*.log
*.rej
*.swo
*.swp
*.vi
*~

# OS or Editor folders
.DS_Store
Thumbs.db
.cache
.project
.settings
.tmproj
.esproj
nbproject/private


# Folders to ignore
.hg
.svn
.CVS
intermediate
publish
.idea


@@ .scss-lint.yml
# Default application configuration that all configurations inherit from.

scss_files: "**/*.scss"
plugin_directories: ['.scss-linters']

# List of gem names to load custom linters from (make sure they are already
# installed)
plugin_gems: []

# Default severity of all linters.
severity: warning

linters:
  BangFormat:
    enabled: true
    space_before_bang: true
    space_after_bang: false

  BemDepth:
    enabled: false
    max_elements: 1

  BorderZero:
    enabled: true
    convention: zero # or `none`

  ChainedClasses:
    enabled: false

  ColorKeyword:
    enabled: true

  ColorVariable:
    enabled: true

  Comment:
    enabled: true
    style: silent

  DebugStatement:
    enabled: true

  DeclarationOrder:
    enabled: true

  DisableLinterReason:
    enabled: false

  DuplicateProperty:
    enabled: true

  ElsePlacement:
    enabled: true
    style: same_line # or 'new_line'

  EmptyLineBetweenBlocks:
    enabled: true
    ignore_single_line_blocks: true

  EmptyRule:
    enabled: true

  ExtendDirective:
    enabled: false

  FinalNewline:
    enabled: true
    present: true

  HexLength:
    enabled: true
    style: short # or 'long'

  HexNotation:
    enabled: true
    style: lowercase # or 'uppercase'

  HexValidation:
    enabled: true

  IdSelector:
    enabled: true

  ImportantRule:
    enabled: true

  ImportPath:
    enabled: true
    leading_underscore: false
    filename_extension: false

  Indentation:
    enabled: true
    allow_non_nested_indentation: false
    character: space # or 'tab'
    width: 2

  LeadingZero:
    enabled: true
    style: exclude_zero # or 'include_zero'

  MergeableSelector:
    enabled: true
    force_nesting: true

  NameFormat:
    enabled: true
    allow_leading_underscore: true
    convention: hyphenated_lowercase # or 'camel_case', or 'snake_case', or a regex pattern

  NestingDepth:
    enabled: true
    max_depth: 3
    ignore_parent_selectors: false

  PlaceholderInExtend:
    enabled: true

  PrivateNamingConvention:
    enabled: false
    prefix: _

  PropertyCount:
    enabled: false
    include_nested: false
    max_properties: 10

  PropertySortOrder:
    enabled: true
    ignore_unspecified: false
    min_properties: 2
    separate_groups: false

  PropertySpelling:
    enabled: true
    extra_properties: []
    disabled_properties: []

  PropertyUnits:
    enabled: true
    global: [
      'ch', 'em', 'ex', 'rem',                 # Font-relative lengths
      'cm', 'in', 'mm', 'pc', 'pt', 'px', 'q', # Absolute lengths
      'vh', 'vw', 'vmin', 'vmax',              # Viewport-percentage lengths
      'deg', 'grad', 'rad', 'turn',            # Angle
      'ms', 's',                               # Duration
      'Hz', 'kHz',                             # Frequency
      'dpi', 'dpcm', 'dppx',                   # Resolution
      '%']                                     # Other
    properties: {}

  PseudoElement:
    enabled: true

  QualifyingElement:
    enabled: true
    allow_element_with_attribute: false
    allow_element_with_class: false
    allow_element_with_id: false

  SelectorDepth:
    enabled: true
    max_depth: 3

  SelectorFormat:
    enabled: true
    convention: hyphenated_lowercase # or 'strict_BEM', or 'hyphenated_BEM', or 'snake_case', or 'camel_case', or a regex pattern

  Shorthand:
    enabled: true
    allowed_shorthands: [1, 2, 3, 4]

  SingleLinePerProperty:
    enabled: true
    allow_single_line_rule_sets: true

  SingleLinePerSelector:
    enabled: true

  SpaceAfterComma:
    enabled: true
    style: one_space # or 'no_space', or 'at_least_one_space'

  SpaceAfterComment:
    enabled: true
    style: at_least_one_space # or 'no_space', or 'at_least_one_space'
    allow_empty_comments: true

  SpaceAfterPropertyColon:
    enabled: true
    style: one_space # or 'no_space', or 'at_least_one_space', or 'aligned'

  SpaceAfterPropertyName:
    enabled: true

  SpaceAfterVariableColon:
    enabled: false
    style: one_space # or 'no_space', 'at_least_one_space' or 'one_space_or_newline'

  SpaceAfterVariableName:
    enabled: true

  SpaceAroundOperator:
    enabled: true
    style: one_space # or 'at_least_one_space', or 'no_space'

  SpaceBeforeBrace:
    enabled: true
    style: space # or 'new_line'
    allow_single_line_padding: false

  SpaceBetweenParens:
    enabled: true
    spaces: 0

  StringQuotes:
    enabled: true
    style: single_quotes # or double_quotes

  TrailingSemicolon:
    enabled: true

  TrailingWhitespace:
    enabled: true

  TrailingZero:
    enabled: false

  TransitionAll:
    enabled: false

  UnnecessaryMantissa:
    enabled: true

  UnnecessaryParentReference:
    enabled: true

  UrlFormat:
    enabled: true

  UrlQuotes:
    enabled: true

  VariableForProperty:
    enabled: false
    properties: []

  VendorPrefix:
    enabled: true
    identifier_list: base
    additional_identifiers: []
    excluded_identifiers: []

  ZeroUnit:
    enabled: true

  Compass::*:
    enabled: false
 
@@ README.md
# PROJECT_NAME

## REQUIREMENT

## GET START

## MEMO

@@ editorconfig
root = true

[*]
indent_style = space
indent_size = 2

end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
