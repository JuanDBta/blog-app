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
  