document.addEventListener("DOMContentLoaded", function() {
  var button = document.getElementById("pagination-button");
  var comments = document.querySelectorAll(".comment-info");

  var commentsVisible = true;

  function hideComments() {
    comments.forEach(function(comment) {
      comment.style.display = "none";
    });
    commentsVisible = false;
  }

  function showComments() {
    comments.forEach(function(comment) {
      comment.style.display = "block";
    });
    commentsVisible = true;
  }

  function toggleCommentsVisibility() {
    if (commentsVisible) {
      hideComments();
    } else {
      showComments();
    }
    location.reload();
  }

  button.addEventListener("click", function() {
    toggleCommentsVisibility();
  });
});
