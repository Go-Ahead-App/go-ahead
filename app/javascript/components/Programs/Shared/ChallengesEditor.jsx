import React from "react";
import { useState } from "react";

function ChallengesEditor({
  programId,
  challengesList,
  setChallengesList,
  setEditChallengeFormValues,
  setEditChallengeFormVisible,
}) {
  const [formValues, setFormValues] = useState({
    name: "",
    description: "",
    program_id: programId,
  });

  function handleSubmit(e) {
    e.preventDefault();

    fetch("/api/v1/challenges", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formValues),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.error) {
          document.getElementById("error-notice").classList.remove("hidden");
        } else {
          document.getElementById("success-notice").classList.remove("hidden");

          setChallengesList([...challengesList, data]);
          setFormValues({
            name: "",
            description: "",
            program_id: programId,
          });
        }

        setTimeout(() => {
          document.getElementById("success-notice").classList.add("hidden");
          document.getElementById("error-notice").classList.add("hidden");
        }, 3000);
      });
  }

  function handleChallengeEditFormSelection(challenge) {
    setEditChallengeFormValues({
      id: challenge.id,
      name: challenge.name,
      description: challenge.description,
      program_id: programId,
    });

    setEditChallengeFormVisible(true);
  }

  return (
    <div>
      <h2 className="font-display">{">> Редактор викликів"}</h2>

      <div className="mt-4">
        <label className="block text-sm font-medium text-gray-700">
          Назва виклику
        </label>

        <input
          type="text"
          name="name"
          id="name"
          className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md"
          value={formValues.name}
          onChange={(e) => {
            setFormValues({
              ...formValues,
              name: e.target.value,
            });
          }}
        />
      </div>

      <div className="mt-4">
        <label className="block text-sm font-medium text-gray-700">
          Опис виклику
        </label>

        <textarea
          name="description"
          id="description"
          className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md"
          rows="8"
          value={formValues.description}
          onChange={(e) => {
            setFormValues({
              ...formValues,
              description: e.target.value,
            });
          }}
        />
      </div>

      <div className="mt-4">
        <button
          type="submit"
          className="px-6 py-4 text-sm bg-neutral-100 text-neutral-700 hover:bg-neutral-50 duration-200 cursor-pointer rounded-md"
          onClick={handleSubmit}
        >
          Додати виклик
        </button>
      </div>

      <div className="mt-8">
        <h2 className="font-display">{">> Список викликів"}</h2>

        <div className="grid grid-cols-2 gap-8">
          {challengesList &&
            challengesList.map((challenge) => (
              <div className="mt-4" key={challenge.id}>
                <div
                  className="flex justify-between rounded-md p-4 bg-neutral-50 hover:shadow-md duration-200 cursor-pointer"
                  onClick={() => handleChallengeEditFormSelection(challenge)}
                >
                  <div>
                    <h3 className="font-medium">{challenge.name}</h3>
                    <p className="text-sm text-gray-500">
                      {challenge.description}
                    </p>
                  </div>
                </div>
              </div>
            ))}
        </div>
      </div>
    </div>
  );
}

export default ChallengesEditor;
