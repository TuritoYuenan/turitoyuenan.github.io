function scl(color, net, url) {
	var cell = document.createElement("A");
	cell.href = "https://"+url;
	cell.style.backgroundColor = color;
	cell.classList.add("bi-" + net);
	document.getElementById("box-scl").appendChild(cell);
}