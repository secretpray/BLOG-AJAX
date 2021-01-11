document.addEventListener('turbolinks:load', function() {
  // Timeout autohide flash notice
  const notice = document.getElementById('flash-notice');
  if (notice) fadeHide(notice, 5000)

  // Timeout autohide flash alert
  const alert = document.getElementById('flash-alert');
  if (alert) fadeHide(alert, 7000)

  // Timeout autohide errors
  const errors = document.querySelector('.border-danger');
  if (errors) fadeHide(errors, 7000)

  // Timeout autohide inline post create  error
  const postInlineError = document.getElementById('errors-post');
  if (postInlineError) fadeHide(postInlineError, 7000)

  // Timeout autohide inline comment create  error
  const commentInlineError = document.getElementById('errors-comment');
  if (commentInlineError) fadeHide(commentInlineError, 7000)
   
  // Timeout autohide Devise error
  const deviseErrorExplanation = document.getElementById('error_explanation');
  if (deviseErrorExplanation) fadeOut(deviseErrorExplanation, 7000)

  function fadeHide(elem, time) {
    window.setTimeout(function() {
      // object.classList.add('fade-out')
      fadeOut(elem, 1000)
    }, time);
  }

  function fadeIn(elem, ms) {
    if (! elem)
      return;

    elem.style.opacity = 0;
    elem.style.filter = "alpha(opacity=0)";
    elem.style.display = "inline-block";
    elem.style.visibility = "visible";

    if (ms) {
      let opacity = 0;
      let timer = setInterval( function() {
        opacity += 50 / ms;
        if (opacity >= 1) {
          clearInterval(timer);
          opacity = 1;
        }
        elem.style.opacity = opacity;
        elem.style.filter = "alpha(opacity=" + opacity * 100 + ")";
      }, 50 );
    } else {
      elem.style.opacity = 1;
      elem.style.filter = "alpha(opacity=1)";
    }
  }

  function fadeOut(elem, ms) {
    if (! elem)
      return;

    if (ms) {
      let opacity = 1;
      let timer = setInterval( function() {
        opacity -= 50 / ms;
        if (opacity <= 0) {
          clearInterval(timer);
          opacity = 0;
          elem.style.display = "none";
          elem.style.visibility = "hidden";
        }
        elem.style.opacity = opacity;
        elem.style.filter = "alpha(opacity=" + opacity * 100 + ")";
      }, 50 );
    } else {
      elem.style.opacity = 0;
      elem.style.filter = "alpha(opacity=0)";
      elem.style.display = "none";
      elem.style.visibility = "hidden";
    }
  }
})
