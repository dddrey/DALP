import React from 'react';

export default class TestComponent extends React.Component {
  constructor(props) {
    super();
    this.state = {
      token: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      data: props.data,
      timeLeft: '60:00'
    };
  }

  componentDidMount() {
    this.setTimer();
    console.log(this.state.data)
  }

  setTimer() {
    const { time } = this.props.data;
    const that = this;

    console.log(time)
    let countDownDate = new Date(time).getTime();

    let x = setInterval(function() {
      let now = new Date().getTime();
      let distance = countDownDate - now;
      let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      let seconds = Math.floor((distance % (1000 * 60)) / 1000);

      that.setState({ timeLeft: `${minutes}:${seconds < 10 ? '0' + seconds : seconds}`})

      if (distance < 0) {
        clearInterval(x);
        window.location = '/test/finished';
      }
    }, 1000);
  }

  submitAnswer(questionID, answerID, text) {
    return fetch('/test/submit_answer', {
      method: 'PUT',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': this.state.token,
      },
      redirect: 'follow',
      referrer: 'no-referrer',
      body: JSON.stringify({ q_id: questionID, a_id: answerID, a_text: text }),
    })
    .then(response => response.json())
    .catch(error => console.error(error))
    .then((response) => {
      console.log(response)
      if (response.finished) {
        window.location = '/test/finished';
      } else {
        this.setState({ data: response.data })
      }
    })
  }


  render() {
    const { order, time, question } = this.state.data;

    return (
      <div className='test-container'>
        <div className='question-number'>{order}/100</div>
        <div className='timer'>{this.state.timeLeft}</div>
        <div className='question arab'>{question.text}</div>
        <div className='answers arab'>
          {
            question.answers.map((answer, index) => {
              return (
                <div className='answer' key={index} onClick={() => this.submitAnswer(question.id, answer.id, answer.text)}>{answer.text}</div>
              )
            })
          }
        </div>
      </div>
    );
  }
}
