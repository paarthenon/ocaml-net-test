(* mumble ping *)

open Unix;;

let sock = socket PF_INET SOCK_STREAM 0 in
let path = "slaterose.com" in
let entry = (gethostbyname path) in
connect sock (ADDR_INET (entry.h_addr_list.(0), 64738)) ;
let str = String.create 1024 in
recv sock str 0 1024 [] ;;

let make_message typ subtype param =
	(BITSTRING {
		typ : 16;
		subtype : 16;
		param : 32
	}) ;;
