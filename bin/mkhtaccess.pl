#!/usr/bin/env perl
use strict;
use warnings;
use Encode;
use utf8;
use Cwd;

my $username;
my $password;
my @ip_list;
my $htaccess      = ".htaccess";
my $htpasswd      = ".htpasswd";
my $robot         = "robots.txt";
my $cwd           = getcwd() . "/";
my $htaccess_tmpl = <<"EOS";
AuthUserFile ${cwd}.htpasswd
AuthGroupFile /dev/null
AuthName "Please enter your ID and password"
AuthType Basic
require valid-user
<Files ~ "^\.(htaccess|htpasswd)$">
deny from all
</Files>
<Files ~ "^robots.txt$">
allow from all
</Files>

order deny,allow
deny from all
allow from localhost
allow from 203.152.217.234
allow from 203.152.217.235
EOS
my $htpasswd_tmpl;
my $robot_tmpl = <<"EOS";
User-agent: *
Disallow: /
EOS

sub mk_htpasswd {
    print ".htaccess & .htpasswd PATH [default=${cwd}]: ";
    $username = <STDIN> || "${cwd}";
    chomp($username);
    print "username[default=admin]: ";
    $username = <STDIN> || "admin";
    chomp($username);
    print "password[default=admin]: ";
    $password = <STDIN> || "admin";
    chomp($password);
    print "allow IP Address without rebelt inc. (multi ip, ',' comma join)\n";
    print "IP list[default=localhost,127.0.0.1]: ";
    my $ip = <STDIN> || "localhost";
    chomp($ip);
    @ip_list = split ',', $ip;

    srand();
    my @salts = ( "A" .. "Z", "a" .. "z", "0" .. "9", ".", "/" );
    my $salt = $salts[ int( rand(64) ) ] . $salts[ int( rand(64) ) ];

    $htpasswd_tmpl = $username . ":" . crypt( $password, $salt );
}

sub write_file {
    my ( $filename, $content ) = @_;
    return unless $content;

    open my $fh, ">", $cwd . $filename or die "Can't open $filename: $!";
    print $fh encode( 'utf8', $content );
    close $fh;
}

sub mk_iplist {
    my ( $template, @list ) = @_;
    return $template unless @list;
    for my $line (@list) {
        chomp $line;
        $template .= "allow from " . $line . "\n";
    }
    return $template;
}

sub main {
    mk_htpasswd();
    $htaccess_tmpl = mk_iplist( $htaccess_tmpl, @ip_list );
    write_file( $htaccess, $htaccess_tmpl );
    write_file( $htpasswd, $htpasswd_tmpl );
    write_file( $robot,    $robot_tmpl );
}

main();
