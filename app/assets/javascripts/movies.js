$(document).on("turbolinks:load", function(){
  /* When the user clicks on the button,
  toggle between hiding and showing the dropdown content */
  function myFunction() {
      document.getElementById("myDropdown").classList.toggle("show");
  }

  // Close the dropdown menu if the user clicks outside of it
  window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {

      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }

  if ( $("#player") != null ){
    originalLink = $("#player").attr("src")

    $("#movie-img-btn").on("click", function(){
      originalSRC = $("#player").attr("src")
      $("#player").attr("src", originalSRC + "?autoplay=1")
    })  

    $("#myModal").on("hidden.bs.modal", function(){
      $("#player").attr("src", originalLink)
    })
  }
})
