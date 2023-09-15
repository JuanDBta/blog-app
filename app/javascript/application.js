// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
  var button = document.getElementById("posts-button");
  var postsContainer = document.querySelector(".posts-container");
  var postsContainerAll = document.querySelector(".posts-container-all");

 
  button.addEventListener("click", function() {
    postsContainer.style.display = "none";
    postsContainerAll.style.display = "block";
    button.style.display = "none";
  });
});

  document.addEventListener("DOMContentLoaded", function() {
    var button = document.getElementById("pagination-button");
    var comments = document.querySelectorAll(".comment-info");
  
    var commentsVisible = true;
  
    function hideComments() {
      comments.forEach(function(comment) {
        comment.classList.add("hidden");
      });
      commentsVisible = false;
    }
  
    function showComments() {
      comments.forEach(function(comment) {
        comment.classList.remove("hidden");
      });
      commentsVisible = true;
    }
  
    function toggleCommentsVisibility() {
      if (commentsVisible) {
        hideComments();
      } else {
        showComments();
      }
    }
  
    button.addEventListener("click", function() {
      toggleCommentsVisibility();
    });
  });
  