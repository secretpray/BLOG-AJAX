document.addEventListener('turbolinks:load', function() {

  let newPostButton = document.getElementById('new-post-button')

  if (newPostButton) {
    document.getElementById('new-post-button').addEventListener("click", (event) => {
      let postDiv = document.getElementById('new_post')

      event.preventDefault()
      if (postDiv.style.display === "block") {
        postDiv.style.display = 'none'
        newPostButton.text = 'New post'
      } else {
        postDiv.style.display = 'block';
        newPostButton.text = 'Cancel'
      }
    });
  }
})
