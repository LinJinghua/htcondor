/***************************************************************
 *
 * Copyright (C) 1990-2007, Condor Team, Computer Sciences Department,
 * University of Wisconsin-Madison, WI.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License.  You may
 * obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ***************************************************************/

#ifndef _USERLOG_TO_CLASSADS_H_
#define _USERLOG_TO_CLASSADS_H_

/***************************************************************
 * Forward declarations
 ***************************************************************/

#include "condor_classad.h"
#include "condor_id.h"

// scan the userlog, build a set of classads, then hand them one at a time to a processing function which may (or may not)
// take ownership of them.
bool userlog_to_classads(const char *filename,
	bool (*pfnProcess)(void* pv, ClassAd* ad), void* pvProcess,
	CondorID* JobIds, int cJobIds, ExprTree *constraintExpr);

#endif // _USERLOG_TO_CLASSADS_H_
