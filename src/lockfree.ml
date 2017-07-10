(*---------------------------------------------------------------------------
   Copyright (c) 2016 KC Sivaramakrishnan. All rights reserved.
   Distributed under the ISC license, see terms at the end of the file.
   %%NAME%% %%VERSION%%
  ---------------------------------------------------------------------------*)

(*---------------------------------------------------------------------------
   Copyright (c) 2016 KC Sivaramakrishnan

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted, provided that the above
   copyright notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  ---------------------------------------------------------------------------*)

(*
########
Copyright (c) 2017, Nicolas ASSOUAD <nicolas.assouad@ens.fr>
########
*)

module type CoreDesc = sig
  val nb_domains : int;;
end;;

module type HashDesc = sig
  val load : int;;
  val nb_bucket : int;;
  val hash_function : int -> int;;
end;;

module MSQueue : Lf_msqueue.S = Lf_msqueue.M;;
module WSQueue : Lf_wsqueue.S = Lf_wsqueue.M;;
module List : Lf_list.S = Lf_list.M;;
module Bag(Desc : CoreDesc) : Lf_bag.S = Lf_bag.Make(Desc);;
module Hash_Custom(Desc : HashDesc) : Lf_hash.S = Lf_hash.Make(Desc);;
module Hash : Lf_hash.S = Hash_Custom(struct
  let load = 3;;
  let nb_bucket = 512;;
  let hash_function x = x;;
end);;
