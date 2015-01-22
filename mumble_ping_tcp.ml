(* mumble ping *)

open Unix;;




let ping_req =
	let ident = 9223372036854775807L in
	let typ = 0l in
	(BITSTRING {
		typ : 32 : bigendian;
		ident : 64 : bigendian
	})


let () =
	let sock = socket PF_INET SOCK_STREAM 0 in
	let path = Sys.argv.(1) in
	let entry = (gethostbyname path) in
	connect sock (ADDR_INET (entry.h_addr_list.(0), 64738)) ;
	let str = String.create 1024 in
	(Bitstring.hexdump_bitstring Pervasives.stdout ping_req);
	let req = Bitstring.string_of_bitstring ping_req in
	send sock req 0 12 [];
	recv sock str 0 1024 [] ;
	let resp = Bitstring.bitstring_of_string str in
	(Bitstring.hexdump_bitstring Pervasives.stdout resp)
