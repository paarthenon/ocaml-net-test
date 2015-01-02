
let open_connection =
	let connection = Curl.init () in
	Curl.setopt connection (Curl.CURLOPT_URL Sys.argv.(1));
	Curl.perform connection

let _ = open_connection
