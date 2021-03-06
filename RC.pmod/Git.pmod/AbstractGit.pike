//#!/usr/bin/env pike
/* -*- Mode: Pike; indent-tabs-mode: t; c-basic-offset: 2; tab-width: 8 -*- */
//! @b{[PROG-NAME]@}
//!
//! Copyright © 2010, Pontus Östlund - @url{http://www.poppa.se@}
//!
//! @pre{@b{License GNU GPL version 3@}
//!
//! [PROG-NAME].pmod is free software: you can redistribute it and/or modify
//! it under the terms of the GNU General Public License as published by
//! the Free Software Foundation, either version 3 of the License, or
//! (at your option) any later version.
//!
//! [MODULE-NAME].pike is distributed in the hope that it will be useful,
//! but WITHOUT ANY WARRANTY; without even the implied warranty of
//! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//! GNU General Public License for more details.
//!
//! You should have received a copy of the GNU General Public License
//! along with [PROG-NAME].pike. If not, see <@url{http://www.gnu.org/licenses/@}>.
//! @}

#include "git.h"

protected void create()
{
  
}

//! Executes a Subversion command
protected string exec(string cmd, void|string file, mixed ... args)
{
  ASSERT_BASE_SET();
  array(string) command = ({ "git", "--git-dir="+.get_git_dir() });

  command += ({ cmd });

  if (sizeof(args))
    command += map(args, lambda(mixed v) { return (string)v; } );

  if (file)
    command += ({ file });

  .Proc p = .Proc(command);
  if (p->run() == 0) 
    return p->result;

  return 0;
}
