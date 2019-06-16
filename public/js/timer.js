
let msecStart = 0;
let secondsMaxValue = 0;
let msecHistoryStart = 0;

let timerMaxValue = 50;
let smallPauseMaxValue = 10;


function startTimer() {

	msecStart = performance.now();
	secondsMaxValue = timerMaxValue * 60;
	playSoundStart();

	showHistory("Работа на " + timerMaxValue + " мин");
	recursiveTimeout();
}

function incTimer() {
	timerMaxValue = btnControlTextChange(true, timerMaxValue, "id_btnTimer", "briefcase");
}

function decTimer() {
	timerMaxValue = btnControlTextChange(false, timerMaxValue, "id_btnTimer", "briefcase");
}

function startPause() {
	msecStart = performance.now();
	secondsMaxValue = smallPauseMaxValue * 60;
	playSoundStart();

	showHistory("Перерыв на " + smallPauseMaxValue + " мин");
	recursiveTimeout();
}

function incSmallPause() {
	smallPauseMaxValue = btnControlTextChange(true, smallPauseMaxValue, "id_btnSmallPause", 'bell');
}

function decSmallPause() {
	smallPauseMaxValue = btnControlTextChange(false, smallPauseMaxValue, "id_btnSmallPause", 'bell');
}

function btnControlTextChange(isIncrementDirection, value, btnControlId, icon) {

	let btnControlIcon = document.querySelector('#' + btnControlId + ' i');
	let btnControlDigit = document.querySelector('#' + btnControlId + ' span');

	let valueText = "05";

	if (isIncrementDirection) {
		if (value <= 55) {
			value += 5;
		}
	} else {
		if (value >= 10) {
			value -= 5;
		}
	}

	if (value > 5) {
		valueText = value.toString();
	}

	btnControlIcon.classList.add('icon-' + icon);
	btnControlDigit.innerText = valueText;

	return value;
}

function recursiveTimeout() {

	var timeoutId = 0;

	timeoutId = setTimeout(function tickTack() {

		if (showTime()) {
			timeoutId = setTimeout(tickTack, 1000);
		} else {
			clearTimeout(timeoutId);
		}

	}, 1000);

}

function playSoundStart() {
	let snd = new Audio('/sounds/ding.mp3');
	snd.play();
}

function playSoundEnd() {
	let snd = new Audio('/sounds/zilbel.mp3');
	snd.play();
}

function showTime() {

	var msecNow = 0,
			secondsSpend = 0,
			secondsSpendCutted = 0,
			minutesSpend = 0;
	var continueCondition = false;
	var timeSpendString = "";

	msecNow = performance.now();

	secondsSpend = ((msecNow - msecStart).toFixed() / 1000).toFixed();

	continueCondition = (secondsMaxValue >= secondsSpend);

	secondsSpend = ((msecNow - msecStart) / 1000).toString().split(".")[0];
	minutesSpend = (secondsSpend / 60).toString().split(".")[0];
	secondsSpendCutted = secondsSpend - (minutesSpend * 60);

	if (minutesSpend < 10) {
		timeSpendString = "0";
	} else {
		timeSpendString = "";
	}

	timeSpendString += minutesSpend.toString() + ":";

	if (secondsMaxValue >= secondsSpend) {
		if (secondsSpendCutted < 10) {
			timeSpendString += "0";
		}
		timeSpendString += secondsSpendCutted.toString();
	} else {
		timeSpendString += "00";

		showHistory("Отсчёт закончен");
		playSoundEnd();
	}

	document.querySelector('#id_timeText').innerHTML = "<p>" + timeSpendString + "</p>";
	document.querySelector('#id_titleText').innerHTML = timeSpendString;

	return continueCondition;
}

function showHistory(nameVal) {

	var nowDate = new Date();

	var newLi = document.createElement("li");

	newLi.innerHTML = nameVal + "<span class = \"time\">"
			+ nowDate.getHours() + "ч:" + nowDate.getMinutes() + "м</span>";

	document.querySelector('#id_listHistory').appendChild(newLi);

}

function init() {
	window.addEventListener("load", function () {

		document.querySelector("#id_btnTimer").addEventListener("click", startTimer);
		document.querySelector("#id_btnTimerDec").addEventListener("click", decTimer);
		document.querySelector("#id_btnTimerInc").addEventListener("click", incTimer);

		document.querySelector("#id_btnSmallPause").addEventListener("click", startPause);

		document.querySelector("#id_btnSmallPauseDec").addEventListener("click", decSmallPause);
		document.querySelector("#id_btnSmallPauseInc").addEventListener("click", incSmallPause);

		msecHistoryStart = performance.now();
		showHistory("Готов к учёту");

	});
}

init();
