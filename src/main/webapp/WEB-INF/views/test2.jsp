<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
/*! Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved. SPDX-License-Identifier: Apache-2.0 */
-->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Broadcast To IVS</title>
  <!-- Google Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic" />
  <!-- CSS Reset -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css" />
  <!-- Milligram CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css" />
  <script src="https://web-broadcast.live-video.net/1.2.0/amazon-ivs-web-broadcast.js"></script>

  <style>
    html,
    body {
      width: 100%;
    }

    #error {
      color: red;
    }

    table {
      display: table;
    }

    #preview {
      margin-bottom: 1.5rem;
      background: green;
      width: 100%;
      height: 300;
    }
  </style>
</head>

<body>
  <!-- Introduction -->
  <header class="container">
    <h1>Broadcast To IVS</h1>

    <p>
      This sample extends the `Capture Webcam Video`. A user should have the ability to capture their device
      camera and broadcast it to IVS.
    </p>
  </header>

  <hr />

  <!-- Error alert -->
  <section class="container">
    <h3 id="error"></h3>
  </section>

  <!-- Compositor preview -->
  <section class="container">
    <canvas id="preview"></canvas>
  </section>

  <!--  Select -->
  <section class="container">
    <label for="video-devices">Select Webcam</label>
    <select disabled id="video-devices">
      <option selected disabled>Choose Option</option>
    </select>

    <label for="audio-devices">Select Microphone</label>
    <select disabled id="audio-devices">
      <option selected disabled>Choose Option</option>
    </select>

    <label for="stream-config">Select Channel Config</label>
    <select disabled id="stream-config">
      <option selected disabled>Choose Option</option>
    </select>
  </section>

  <!-- Ingest Endpoint input -->
  <section class="container">
    <label for="ingest-endpoint">Ingest Endpoint</label>
    <input type="text" id="ingest-endpoint" value="" />
  </section>

  <!-- Stream Key input -->
  <section class="container">
    <label for="stream-key">Stream Key</label>
    <input type="text" id="stream-key" value="" />
  </section>

  <!-- Broadcast buttons -->
  <section class="container">
    <button class="button" id="start" disabled onclick="startBroadcast()">Start Broadcast</button>
    <button class="button" id="stop" disabled onclick="stopBroadcast()">Stop Broadcast</button>
  </section>

  <hr />

  <!-- Data table -->
  <section class="container">
    <table id="data">
      <tbody></tbody>
    </table>
  </section>
  
   <script src="${pageContext.request.contextPath}/resources/js/test2.js" defer=""></script>
</body>

</html>