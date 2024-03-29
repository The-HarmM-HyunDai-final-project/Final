/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: MIT-0
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this
 * software and associated documentation files (the "Software"), to deal in the Software
 * without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

const playbackUrlTag = document.getElementById("playbackUrl");

const playbackUrl = playbackUrlTag.value;
const videoPlayer = document.getElementById("video-player");
const quizEl = document.getElementById("quiz");
const waitMessage = document.getElementById("waiting");
const questionEl = document.getElementById("question");
const answersEl = document.getElementById("answers");
const cardInnerEl = document.getElementById("card-inner");

function playIVSPlay(IVSPlayer){
	  console.log(videoPlayer);
	  const PlayerState = IVSPlayer.PlayerState;
	  const PlayerEventType = IVSPlayer.PlayerEventType;

	  // Initialize player
	  const player = IVSPlayer.create();
	  player.attachHTMLVideoElement(videoPlayer);

	  // Attach event listeners
	  player.addEventListener(PlayerState.PLAYING, function () {
	    console.log("Player State - PLAYING");

	  });
	  player.addEventListener(PlayerState.ENDED, function () {
	    console.log("Player State - ENDED");
	  });
	  player.addEventListener(PlayerState.READY, function () {
	    console.log("Player State - READY");
	    document.getElementById("player-ready").style.display = "none";
	    stopAlert();
	  });
	//  player.addEventListener(PlayerEventType.ERROR, function (err) {
//	    console.warn("Player Event - ERROR:", err);
//	    setTimeout(function(){
//	    	location.reload();
//	    	},3000);
	//  });

	  player.addEventListener(PlayerEventType.TEXT_METADATA_CUE, function (cue) {
	    const metadataText = cue.text;
	    const position = player.getPosition().toFixed(2);
	    console.log(
	      `PlayerEvent - METADATA: "${metadataText}". Observed ${position}s after playback started.`
	    );
	    triggerQuiz(metadataText);
	  });

	  // Setup stream and play
	  player.setAutoplay(true);
	  player.load(playbackUrl);

	  // Setvolume
	  player.setVolume(0.1);
}

startAlert = function() {
	  playAlert = setInterval(function() {
		  playIVSPlay(window.IVSPlayer);
		  console.log("라이브 찾는중");
	  }, 3000);
	};

stopAlert = function() {
   clearInterval(playAlert);
};

startAlert();



//(function (IVSPlayer) {
//	
//  console.log(videoPlayer);
//  const PlayerState = IVSPlayer.PlayerState;
//  const PlayerEventType = IVSPlayer.PlayerEventType;
//
//  // Initialize player
//  const player = IVSPlayer.create();
//  player.attachHTMLVideoElement(videoPlayer);
//
//  // Attach event listeners
//  player.addEventListener(PlayerState.PLAYING, function () {
//    console.log("Player State - PLAYING");
//    document.getElementById("player-ready").style.display = "none";
//  });
//  player.addEventListener(PlayerState.ENDED, function () {
//    console.log("Player State - ENDED");
//  });
//  player.addEventListener(PlayerState.READY, function () {
//    console.log("Player State - READY");
//  });
////  player.addEventListener(PlayerEventType.ERROR, function (err) {
////    console.warn("Player Event - ERROR:", err);
////    setTimeout(function(){
////    	location.reload();
////    	},3000);
////  });
//
//  player.addEventListener(PlayerEventType.TEXT_METADATA_CUE, function (cue) {
//    const metadataText = cue.text;
//    const position = player.getPosition().toFixed(2);
//    console.log(
//      `PlayerEvent - METADATA: "${metadataText}". Observed ${position}s after playback started.`
//    );
//    triggerQuiz(metadataText);
//  });
//
//  // Setup stream and play
//  player.setAutoplay(true);
//  player.load(playbackUrl);
//
//  // Setvolume
//  player.setVolume(0.1);
//
//})(window.IVSPlayer);