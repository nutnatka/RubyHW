def save_content(content, file_name = "index.html.erb")
  html_template = "<!doctype html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport'
          content='width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title>Document</title>
</head>
<body>
<script>
     setInterval(()=>{ window.location.reload() }, 2000)
 </script>
 #{content}
</body>
</html>"

  File.write(file_name, html_template)
end
