-module(sum).
-behaviour(gen_server).

-export([init/1, handle_call/3]).

init(_Arg) ->
    {ok, 0}.

handle_call({add, Data}, From, Sum) ->
  gen_server:reply(From, ok),
  % time out is required due to the IO command
  % if there is none the process will crash
  timer:sleep(1000),
  NewSum = add(Data, Sum),
  io:format("From:~p, Sum:~p~n",[From, NewSum]),
  {noreply, NewSum}.

add(A, B) ->
  A + B.
