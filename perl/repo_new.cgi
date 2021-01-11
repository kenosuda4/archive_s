#!C:\Strawberry/perl/bin/perl

use strict;
use warnings;
use Smart::Comments;
use Encode 'encode';
#cgiヘッダーの出力

my $PostData = "";
my %IN = ();
read (STDIN, $PostData, $ENV{'CONTENT_LENGTH'});
foreach my $data (split(/&/, $PostData)) {
  (my $key, my $value) = split(/=/, $data);

  $IN{"$key"} = $value;
  $value = encode('UTF-8' ,$value)
}
### %IN
my $DB = "./db/users/$IN{date}.csv";
open (DB, ">> $DB");
print DB " $IN{id}, $IN{name}, $IN{date}, $IN{repo}\r";
close(DB);
# print() on closed filehandle 理由不明パスが原因？

print "Content-Type: text/html;charset=utf-8\n\n";

open(FILE, "html/repo_new.html");
my @html = <FILE>;
close(FILE);

for my $html (@html){
	print $html;
}

exit;