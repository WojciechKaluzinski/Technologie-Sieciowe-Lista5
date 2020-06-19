  #!/usr/bin/perl
use HTTP::Daemon;
use HTTP::Response;
use HTTP::Status;

my $d = HTTP::Daemon->new(
        LocalAddr => 'localhost',
        LocalPort => 5002,
    ) || die;

 print "Please contact me at: <URL:", $d->url, ">\n";

while (my $c = $d->accept) {
    while (my $resp = $c->get_request) {
            my $payload = $resp->as_string;
            my $resp = HTTP::Response->new(200);
            $resp->header("Content-Type" => "text/text");
            $resp->content($payload);
            $c->send_response($resp);
    }
    $c->close;
    undef($c);
}


