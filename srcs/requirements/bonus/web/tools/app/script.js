function toggleDetails() {
    const components = document.getElementById("docker-components");
    if (components.style.display === "none") {
        components.style.display = "block";
    } else {
        components.style.display = "none";
    }
}
