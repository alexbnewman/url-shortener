function copyLink() {
    let linkCopy = document.getElementById("longUrl");
    linkCopy.select();
    document.execCommand("copy");
    document.getElementById("verifyCopy").innerHTML = "Link copied!";
  }
  function selectLink() {
    let linkCopy = document.getElementById("longUrl");
    linkCopy.select();
  }
