'use strict';

function copyToClipboard(text) {
	window.prompt("Скопируйте адрес почты безопасным способом: Ctrl+C, Enter", text);
}

function offsetResize() {


	let windowWidth = window.innerWidth;


}


function init() {

	offsetResize();
	window.addEventListener("resize", offsetResize);
}

window.addEventListener("load", init);




