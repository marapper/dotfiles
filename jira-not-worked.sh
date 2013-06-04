#!/usr/bin/perl
use strict;
my $username = "sergey.bondar";
my $password = "skrilLex7u";
my $jiraurl = "https://ironsoft-jira.atlassian.net";
`wget --quiet --no-check-certificate -O issues.txt '$jiraurl/rest/api/latest/search?os_username=$username&os_password=$password&jql=issuekey%20in%20watchedIssues()' 2>&1`;
if ( !$? ) {
open FF, "issues.txt";
my $json = ;
close(FF);
my @matches = $json =~ /"key":"(.*?)"/g;
my @fissues = grep( /-/, @matches );
print join( "\n", @fissues ) . "\n";
foreach (@fissues) {
`curl -X DELETE '$jiraurl/rest/api/latest/issue/$_/watchers?os_username=$username&os_password=$password&username=$username'`;

}
}
else {
print("Unable to access JIRA [$jiraurl]\n");
}
