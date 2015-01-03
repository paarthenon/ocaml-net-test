
let printfunc input =
	let xdoc = Xml.parse_string input in
	print_string (Xml.to_string_fmt xdoc); String.length input


let open_connection =
	let connection = Curl.init () in
	Curl.setopt connection (Curl.CURLOPT_URL Sys.argv.(1));
	Curl.setopt connection (Curl.CURLOPT_WRITEFUNCTION printfunc);
	Curl.perform connection
	(* let xdoc = Xml.parse_string str in
	Xml.to_string_fmt xdoc*)

let _ = open_connection
