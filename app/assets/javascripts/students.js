// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// RandomText will show text by randomizing each char.
//
// usage:
//
//   var randomText = new RandomText(document.getElementById('target'))
//   randomText.start()
//
(function (window) {
  var dom; // target dom
  var number; // displayed number
  var sourceChars = "0123456789";

  var RandomText = function (_dom) {
    dom    = _dom;
    number = _dom.innerText;
  };

  RandomText.prototype.start = function () {
    for (var digit = 0; digit <= 5; digit++) {
      for (var i = 1; i <= 50; i++) {
        setTimeout(
          function () {
            dom.innerText = getDecidedChars(number, this.digit) + getRandomChars(sourceChars, number.length - this.digit)
          }.bind({ digit: digit }),
          (digit * 400) + (i * 8)
        );
      }
    }
  };

  function getRandomInt(max) {
    return Math.floor(Math.random() * (max + 1));
  }

  function getRandomCharFrom(str) {
    return str[getRandomInt(str.length-1)];
  }

  function getRandomChars(str, len) {
    var result = "";
    for (var i = 1; i <= len; i++) {
      result += getRandomCharFrom(str);
    }
    return result;
  }

  function getDecidedChars(str, len) {
    return str.slice(0, len)
  }

  window.RandomText = RandomText;
}(window));
