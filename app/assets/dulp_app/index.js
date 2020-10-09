import './stylesheets/index.scss';
import { scrollIt } from "./scroll_it";
import "./remove_hover_on_touch";
import React from 'react';
import ReactDOM from 'react-dom';
window.scrollIt = scrollIt;

import TestComponent from './components/test_component.jsx';

document.addEventListener('DOMContentLoaded', () => {
  let testDiv = document.getElementById('test-component');

  if (testDiv) {
    let data = JSON.parse(testDiv.getAttribute('data'));

    ReactDOM.render(
      <TestComponent data={data} />, testDiv
    );
  }

  const regCheckBox = document.querySelector('.form-actions-agree input[type=checkbox]');
  const submitButton = document.querySelector('input[type=submit].authorization-button');
  if (regCheckBox) {
  	regCheckBox.addEventListener('click', () => {
	    const isChecked = regCheckBox.checked;

	    if (isChecked) {
	    	submitButton.disabled = false;
	    } else {
	    	submitButton.disabled = true;
	    }
	  });
  }
});


