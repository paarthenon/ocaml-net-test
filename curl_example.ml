
  let _ =
    let connection = Curl.init () in
      Curl.setopt connection (Curl.CURLOPT_URL Sys.argv.(1));
      Curl.perform connection
