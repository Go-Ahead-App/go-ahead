import React from "react";

function ChallengeForm({ program, setValues, token }) {
  function addChallenge(e) {
    e.preventDefault();

    const challenge = {
      name: document.getElementById("challenge_name").value,
      description: document.getElementById("challenge_description").value,
      day: document.getElementById("challenge_day").value,
      program_id: program.id,
    };

    fetch("/challenges", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": token,
      },
      body: JSON.stringify(challenge),
    }).then((response) => {
      if (response.ok) {
        response.json().then((challenge) => {
          setValues((values) => ({
            ...values,
            challenges: [...values.challenges, challenge],
          }));

          document.getElementById("challenge_name").value = "";
          document.getElementById("challenge_description").value = "";
          document.getElementById("challenge_day").value = "";
        });
      }
    });
  }

  return (
    <div className="mt-4 mb-12 w-full p-4 bg-neutral-900">
      <form action="">
        <div className="mt-4">
          <div className="flex space-x-4">
            <div>
              <label htmlFor="name" className="text-xs">
                Name
              </label>
              <input
                type="text"
                id="challenge_name"
                name="challenge[name]"
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
              />
            </div>

            <div>
              <label htmlFor="day" className="text-xs">
                day
              </label>
              <input
                type="number"
                id="challenge_day"
                name="challenge[day]"
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
              />
            </div>
          </div>
        </div>

        <div className="mt-4">
          <label htmlFor="description" className="text-xs">
            Description
          </label>
          <textarea
            name="challenge[description]"
            id="challenge_description"
            className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
          ></textarea>
        </div>

        <button
          className="px-6 py-4 text-sm bg-neutral-900 duration-200 hover:bg-neutral-800 mt-4 block w-full"
          onClick={addChallenge}
        >
          Add Challenge
        </button>
      </form>
    </div>
  );
}

export default ChallengeForm;
