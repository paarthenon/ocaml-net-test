
let _ =
	let url = Sys.argv.(1) in
	let call = new Http_client.get url in
	let pipeline = new Http_client.pipeline in
	pipeline#add call;
	pipeline#run ();
	match call#status with
		| `Successful -> print_string (call#get_resp_body ()); "Success"
		| _ -> "Failure"
