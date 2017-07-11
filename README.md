# Castle.io API Client for Perl

Castle detects and mitigates account takeover in web and mobile apps. This is a Perl client for the Castle.IO API web service (api.castle.io).


## Installation

To install this module, run the following commands:

    perl Makefile.PL
    make
    make test
    make install


## Configuration

    use WebService::CastleIO;

    my $castle = WebService::CastleIO->new(
        api_secret => 'sRq3Zmzpxwu6eDXiYCFB3xyfi4ZnVjnn',
        cookie_id  => 'abcd',
        ip_address => '24.61.128.172',
        headers    => JSON->new->allow_nonref->utf8->encode({'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0'}),
        source     => 'backend',
        debug      => 1
    );


## Usage


### Create Event

Track lets you record security-related actions your users perform. Events are processed asynchronously to return as quickly as possible.

    my $event_result = $castle->track(
        data => {user_id => 'dummy', name => '$login.succeeded', properties => {threat => 'Large', whatever => 'made up'}}
    );


### Authenticate

Authenticate is processed synchronous and returns returns an action of the types approve, challenge or deny.

    my $auth_result = $castle->authenticate(
        data => {user_id => 'dummywriter', name => '$login.succeeded'},
    );


### Identify

User updates are processed asynchronously to return as quickly as possible.

    my $identify_result = $castle->identify(
        data => {user_id => 'dummywriter', traits => {'foo' => 'bar'}},
    );


### Review

Reviews lets you fetch the context for a user to review anomalous account activity.

    my $reviews_result = $castle->review(review_id => 12356789);



## Support and Documentation

After installing, you can find documentation for this module with the perldoc command.

    perldoc WebService::CastleIO

You can also look for information at:

    RT, CPAN's request tracker (report bugs here)
        http://rt.cpan.org/NoAuth/Bugs.html?Dist=WebService-CastleIO

    AnnoCPAN, Annotated CPAN documentation
        http://annocpan.org/dist/WebService-CastleIO

    CPAN Ratings
        http://cpanratings.perl.org/d/WebService-CastleIO

    Search CPAN
        http://search.cpan.org/dist/WebService-CastleIO/


## Disclaimer

This project and the code therein was not created by and is not supported by WealthForge.


## Author

Dino Simone (dino@simone.is)
https://www.linkedin.com/in/dinosimone/
