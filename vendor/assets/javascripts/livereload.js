console = window.console;
if (!console) {
  console = {log: {}, error: {}}
}
var ws = new WebSocket("ws://localhost:35729");
ws.onopen = function() {
  console.info("[WebSocket] open");
}
ws.onmessage = function(e) {

  data = JSON.parse(e.data);
  if (data.command == "reload") {
    console.info("reloading");
    window.location.reload();
  }
  return true;
}
