  #!/usr/bin/perl
  use HTTP::Daemon;
  use HTTP::Status;  


  my $d = HTTP::Daemon->new(
           LocalAddr => 'localhost',
           LocalPort => 5004,
       )|| die;
  
  print "Please contact me at: <URL:", $d->url, ">\n";


  while (my $c = $d->accept) {
      while (my $r = $c->get_request) {
          if ($r->method eq 'GET') {
              
              $file_s= "pages/helloworld.html";    
              $c->send_file_response($file_s);

          }
          else {
              $c->send_error(RC_FORBIDDEN)
          }

      }
      $c->close;
      undef($c);
  }
