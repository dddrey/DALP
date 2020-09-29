import './stylesheets/index.scss';
import { scrollIt } from "./scroll_it";
import "./remove_hover_on_touch";
import React from 'react';
import ReactDOM from 'react-dom';
window.scrollIt = scrollIt;

import TestComponent from './components/test_component.jsx';

document.addEventListener('DOMContentLoaded', () => {
  let testDiv = document.getElementById('test-component');
  console.log(testDiv)

  if (testDiv) {
    let data = JSON.parse(testDiv.getAttribute('data'));

    ReactDOM.render(
      <TestComponent data={data} />, testDiv
    );
  }
});


