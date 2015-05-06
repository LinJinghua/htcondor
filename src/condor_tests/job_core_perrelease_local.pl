#! /usr/bin/env perl
##**************************************************************
##
## Copyright (C) 1990-2007, Condor Team, Computer Sciences Department,
## University of Wisconsin-Madison, WI.
## 
## Licensed under the Apache License, Version 2.0 (the "License"); you
## may not use this file except in compliance with the License.  You may
## obtain a copy of the License at
## 
##    http://www.apache.org/licenses/LICENSE-2.0
## 
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
##**************************************************************

use CondorTest;

$testdesc =  'Condor PERIODIC_RELEASE policy test - local U';
$testname = "job_core_perrelease_local";

my $nostatus = CondorTest::verbose_system("./job_core_perrelease-false_local.pl");
my $willstatus = CondorTest::verbose_system("./job_core_perrelease-true_local.pl");

my %listoftests;
$listoftests{"corename"} = "job_core_perrelease";
$listoftests{"tests"} = [ "job_core_perrelease-false_local", "job_core_perrelease-true_local"];
$listoftests{"extensions"} = [ ".cmd", ".cmd.out", ".err", ".out", ".log"];
CondorTest::MergeOutputFiles(\%listoftests);

if($nostatus != 0)
{
	CondorTest::debug("PERIODIC_RELEASE: failed no trigger test\n",1);
}

if($willstatus != 0)
{
	CondorTest::debug("PERIODIC_RELEASE: failed trigger test\n",1);
}

if(($willstatus != 0) || ($nostatus != 0))
{
	die "Failed one PERIODIC_RELEASE test\n";
}

