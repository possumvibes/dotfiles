# Copyright (c) 2023, Dimitri Sabadie <dimitri.sabadie@gmail.com>
#               2023, possumvibes

# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.

#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.

#     * Neither the name of Dimitri Sabadie <dimitri.sabadie@gmail.com> nor the names of other
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Tasks as adapted from Dimitri Sabadie's notes.kak <https://github.com/phaazon/notes.kak>

## Root directory for task searching
declare-option str kak_tasks_root

## Task symbols
declare-option str kak_tasks_sym_todo 'TODO'
declare-option str kak_tasks_sym_wip 'WIP'
declare-option str kak_tasks_sym_done 'DONE'
declare-option str kak_tasks_sym_wontdo 'WONTDO'
declare-option str kak_tasks_sym_idea 'IDEA'

declare-option -hidden str kak_tasks_list_current_line

## Appearance: uses terminal colors
set-face global kak_tasks_todo green
set-face global kak_tasks_wip magenta
set-face global kak_tasks_done black
set-face global kak_tasks_done_text black
set-face global kak_tasks_wontdo black
set-face global kak_tasks_wontdo_text black+s
set-face global kak_tasks_idea blue
set-face global kak_tasks_task_list_delimiter black
set-face global kak_tasks_task_list_path blue
set-face global kak_tasks_task_list_line white
set-face global kak_tasks_task_list_col white
set-face global kak_tasks_subtask_uncheck green
set-face global kak_tasks_subtask_uncheck magenta
set-face global kak_tasks_subtask_check black
set-face global kak_tasks_subtask_text_check black
set-face global kak_notes_tag green

add-highlighter shared/kak-tasks group
add-highlighter shared/kak-tasks/todo regex "-\s*(%opt{kak_tasks_sym_todo})\s*[^\n]*"\
  1:kak_tasks_todo
add-highlighter shared/kak-tasks/wip regex "-\s*(%opt{kak_tasks_sym_wip})\s*[^\n]*"\
  1:kak_tasks_wip
add-highlighter shared/kak-tasks/done regex "-\s*(%opt{kak_tasks_sym_done})\s*([^\n]*)"\
  1:kak_tasks_done 2:kak_tasks_done_text
add-highlighter shared/kak-tasks/wontdo regex "-\s*(%opt{kak_tasks_sym_wontdo})\s*([^\n]*)"\
  1:kak_tasks_wontdo 2:kak_tasks_wontdo_text
add-highlighter shared/kak-tasks/idea regex "-\s*(%opt{kak_tasks_sym_idea})\s*[^\n]*"\
  1:kak_tasks_idea
add-highlighter shared/kak-tasks/issue regex " (#[0-9]+)"\
  1:kak_tasks_issue
add-highlighter shared/kak-tasks/subtask-uncheck regex "-\s* (\[ \])[^\n]*"\
  1:kak_tasks_subtask_uncheck
add-highlighter shared/kak-tasks/subtask-partialcheck regex "-\s* (\[-\])[^\n]*"\
  1:kak_tasks_subtask_partialcheck
add-highlighter shared/kak-tasks/subtask-check regex "-\s* (\[x\])\s*([^\n]*)"\
  1:kak_tasks_subtask_check 2:kak_tasks_subtask_text_check
add-highlighter shared/kak-tasks/tag regex " (:[^:]+:)" 0:kak_tasks_tag

add-highlighter shared/kak-tasks-list group
add-highlighter shared/kak-tasks-list/path regex "^((?:\w:)?[^:\n]+):(\d+):(\d+)?" 1:cyan 2:green 3:green
add-highlighter shared/kak-tasks-list/current-line line %{%opt{kak_tasks_list_current_line}} default+b

## Commands
define-command kak-task-switch-status -params 1 -docstring 'switch task' %{
  execute-keys -draft "gilec%arg{1}"
}

define-command kak-tasks-list-by-regex -params 1 -docstring 'list tasks by status' %{
  edit -scratch *kak-tasks-list*
  unset-option buffer kak_tasks_list_current_line
  execute-keys "%%d|rg -n --column %arg{1} %opt{kak_tasks_root}<ret>|sort<ret>gg"
}

define-command kak-tasks-list-all -docstring 'list all tasks' %{
  kak-tasks-list-by-regex "%opt{kak_tasks_sym_todo}\|%opt{kak_tasks_sym_wip}\|%opt{kak_tasks_sym_done}\|%opt{kak_tasks_sym_wontdo}\|%opt{kak_tasks_sym_idea}"
}

define-command kak-tasks-list-open -docstring 'list open tasks' %{
  kak-tasks-list-by-regex "%opt{kak_tasks_sym_todo}\|%opt{kak_tasks_sym_wip}"
}

# Command executed when pressing <ret> in a *kak-tasks-list* buffer.
define-command -hidden kak-tasks-goto-task %{
  set-option buffer kak_tasks_list_current_line %val{cursor_line}
  execute-keys -with-hooks -save-regs 'flc' 'giT:"fyllT:"lyllT:"cy:edit "%reg{f}" %reg{l} %reg{c}<ret>'
}

## User modes
declare-user-mode kak-tasks
declare-user-mode kak-tasks-list

map global kak-tasks-list a ":kak-tasks-list-all<ret>"                                 -docstring 'list all tasks'
map global kak-tasks-list d ":kak-tasks-list-by-regex %opt{kak_tasks_sym_done}<ret>"   -docstring 'list done tasks'
map global kak-tasks-list i ":kak-tasks-list-by-regex %opt{kak_tasks_sym_idea}<ret>"   -docstring 'list ideas'
map global kak-tasks-list l ":kak-tasks-list-by-regex '\ :[^:]+:'<ret>"                -docstring 'list tasks by labels'
map global kak-tasks-list n ":kak-tasks-list-by-regex %opt{kak_tasks_sym_wontdo}<ret>" -docstring 'list wontdo tasks'
map global kak-tasks-list o ":kak-tasks-list-open<ret>"                                -docstring 'list open tasks'
map global kak-tasks-list t ":kak-tasks-list-by-regex %opt{kak_tasks_sym_todo}<ret>"   -docstring 'list todo tasks'
map global kak-tasks-list w ":kak-tasks-list-by-regex %opt{kak_tasks_sym_wip}<ret>"    -docstring 'list wip tasks'

hook -group kak-tasks global WinCreate \*kak-tasks-list\* %{
  map buffer normal '<ret>' ':kak-tasks-goto-task<ret>'
  add-highlighter window/ ref kak-tasks
  add-highlighter window/ ref kak-tasks-list
}

hook -group kak-tasks global WinCreate .*\.md %{
  add-highlighter window/ ref kak-tasks

  map window kak-tasks d ":kak-task-switch-status %opt{kak_tasks_sym_done}<ret>"   -docstring 'switch task to done'
  map window kak-tasks i ":kak-task-switch-status %opt{kak_tasks_sym_idea}<ret>"   -docstring 'switch task to idea'
  map window kak-tasks n ":kak-task-switch-status %opt{kak_tasks_sym_wontdo}<ret>" -docstring 'switch task to wontdo'
  map window kak-tasks t ":kak-task-switch-status %opt{kak_tasks_sym_todo}<ret>"   -docstring 'switch task to todo'
  map window kak-tasks w ":kak-task-switch-status %opt{kak_tasks_sym_wip}<ret>"    -docstring 'switch task to wip'
  map window kak-tasks l ":kak-tasks-list-open<ret>"                               -docstring 'list all open tasks'
  map window kak-tasks L ":enter-user-mode kak-tasks-list<ret>"                    -docstring 'list tasks mode'
}
