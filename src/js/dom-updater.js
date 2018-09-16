function getChallengeTemplate() {
  return `<div class="content">
            <p class="topTextBold text-center">The meaning of life</p>
            <p class="topTextBold"></p>
          </div>
          
          <div class="bottomContent">
            <button class="btnBottom" id="submit-button"><span id="btnBottomText">Submit Answer</span></button>
          </div>
          `
}

function getVictoryTemplate() {
  return `<div class="content">
            <h1 class="topTextBold text-center">VICTORY</h1>
          </div>

          <div class="bottomContent">
            <button class="btnBottom"><span id="btnBottomText">OH YEAHHHHH</span></button>
          </div>
         `
}

function swapInChallenge() {
  // changes the html
  const container = document.getElementById("content-wrapper");
  container.innerHTML= getChallengeTemplate();
}

function swapInVictory() {
  const container = document.getElementById("content-wrapper");
  container.innerHTML = getVictoryTemplate();
}

function indicateError() {
  const buttonText = document.getElementById("btnBottomText");
  const tmp = buttonText.innerText;

  buttonText.innerText = `Wrong !`;
  setTimeout(() => buttonText.innerText = tmp, 2000)
}
