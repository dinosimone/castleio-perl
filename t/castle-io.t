#!/usr/bin/perl
##!perl -T
#use 5.006;
use strict;
use warnings;
use Test::More;
use WebService::CastleIO;
use Test::VCR::LWP;
use JSON;


plan tests => 4;


my $castle = WebService::CastleIO->new(
    api_secret => 'sR73Zmzpxeu6nDXiYCFBLxyfiDZnVjnn',
    cookie_id  => 'abcd',
    ip_address => '21.61.118.171',
    headers    => JSON->new->allow_nonref->utf8->encode({'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0'}),
    source     => 'backend',
    debug      => 1
);


my $event_result = $castle->track(
    data    => {user_id => 'dummy', name => '$login.succeeded', properties => {threat => 'Large', whatever => 'made up'}}
);

ok($event_result == 204, "Create event");


my $auth_result = $castle->authenticate(
    data => {user_id => 'dummywriter', name => '$login.succeeded'},
);

ok($auth_result == 201, "Authentication approved");


my $identify_result = $castle->identify(
    data => {user_id => 'dummywriter', traits => {'foo' => 'bar'}},
);
 
ok($identify_result == 204, "Identify user");


my $reviews_result = $castle->review(review_id => 12356789);

ok($reviews_result == 404, "Review not found by ID")

