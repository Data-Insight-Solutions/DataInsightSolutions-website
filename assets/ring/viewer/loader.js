(function () {
  var frame = document.getElementById('frame');
  var started = false;
  function start() {
    if (started) return; started = true;
    var s = document.createElement('script'); s.src = 'viewer.js';
    s.onerror = function () { var f = document.getElementById('fallback'); if (f && !document.getElementById('poster')) f.hidden = false; };
    document.body.appendChild(s);
  }
  if (!('IntersectionObserver' in window)) return start();
  var io = new IntersectionObserver(function (es) {
    for (var i = 0; i < es.length; i++) if (es[i].isIntersecting) { io.disconnect(); start(); return; }
  }, { rootMargin: '200px' });
  io.observe(frame);
})();
