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

  let interviewSlots = document.querySelectorAll('.interview_slot');

  if (interviewSlots.length > 0) {
    let dateInput = document.getElementById('selected-date');
    let interviewIdInput = document.querySelector('form > input#id');
    let submitFormButton = document.querySelector("form > input[type='submit']");

    interviewSlots.forEach((is) => {
      is.addEventListener('click', (e) => {
        dateInput.innerHTML = 'Выбранное время: ' + e.target.getAttribute('datetime');
        submitFormButton.style = 'display: block;';
        interviewIdInput.value = e.target.getAttribute('id');
      });
    });
  }

  let birthInput = document.getElementById('user_birth_date');

  if (birthInput) {
    birthInput.addEventListener('keypress', (event) => {
      let value = event.target.value.replace(/[^0-9\.]+/g, '');

      let v = value.replace(/\D/g,'').slice(0, 10);
      if (v.length >= 5) {
        v = `${v.slice(0, 2)}/${v.slice(2, 4)}/${v.slice(4, 7)}`;
      } else if (v.length >= 3) {
        v = `${v.slice(0, 2)}/${v.slice(2)}`;
      }

      event.target.value = v;
    });
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


