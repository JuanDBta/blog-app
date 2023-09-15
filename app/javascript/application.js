// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
    var button = document.getElementById("posts-button");
  
    // Función para mostrar todos los posts
    function showAllPosts() {
      var postsContainer = document.querySelector(".posts-container");
      var postsContainerAll = document.querySelector(".posts-container-all");
      postsContainer.style.display = "none";
      postsContainerAll.style.display = "block";
      button.style.display = "none"; // Oculta el botón después de mostrar todos los posts
    }
  
    // Agrega un event listener al botón
    button.addEventListener("click", function() {
      showAllPosts();
    });
  });

  document.addEventListener("DOMContentLoaded", function() {
    var button = document.getElementById("pagination-button");
    var comments = document.querySelectorAll(".comment-info");
  
    // Variable para rastrear el estado de los comentarios
    var commentsVisible = true;
  
    // Función para ocultar los comentarios
    function hideComments() {
      comments.forEach(function(comment) {
        comment.classList.add("hidden");
      });
      commentsVisible = false;
    }
  
    // Función para mostrar los comentarios
    function showComments() {
      comments.forEach(function(comment) {
        comment.classList.remove("hidden");
      });
      commentsVisible = true;
    }
  
    // Función para alternar la visibilidad de los comentarios
    function toggleCommentsVisibility() {
      if (commentsVisible) {
        hideComments();
      } else {
        showComments();
      }
    }
  
    // Agrega un event listener al botón de paginación
    button.addEventListener("click", function() {
      toggleCommentsVisibility();
    });
  });
  