import React from "react";
import { useState, useEffect } from "react";

import DetailsSection from "./Shared/DetailsSection";
import ChallengesEditor from "./Shared/ChallengesEditor";
import ActionsEditor from "./Shared/ActionsEditor";

function Edit({ program, challenges }) {
  const [programDetails, setProgramDetails] = useState({
    id: program.id,
    name: program.name,
    description: program.description,
    length: program.length,
    difficulty: program.difficulty,
  });

  const [challengesList, setChallengesList] = useState(challenges);

  const [editChallengeFormValues, setEditChallengeFormValues] = useState({
    id: "",
    name: "",
    description: "",
    program_id: program.id,
  });

  const [editChallengeFormVisible, setEditChallengeFormVisible] =
    useState(false);

  useEffect(() => {
    const currentTab = localStorage.getItem("currentProgramEditAdminTab");
    if (currentTab) {
      setCurrentTab(currentTab);
    }
  }, []);

  const [currentTab, setCurrentTab] = useState("details");

  useEffect(() => {
    localStorage.setItem("currentProgramEditAdminTab", currentTab);
  }, [currentTab]);

  function handleChallengeUpdate(e) {
    e.preventDefault();

    fetch(`/api/v1/challenges/${editChallengeFormValues.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(editChallengeFormValues),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.error) {
          document.getElementById("error-notice").classList.remove("hidden");
        } else {
          document.getElementById("success-notice").classList.remove("hidden");

          const updatedChallengesList = challengesList.map((challenge) => {
            if (challenge.id === data.id) {
              return data;
            } else {
              return challenge;
            }
          });

          setChallengesList(updatedChallengesList);
          setEditChallengeFormVisible(false);
        }

        setTimeout(() => {
          document.getElementById("success-notice").classList.add("hidden");
          document.getElementById("error-notice").classList.add("hidden");
        }, 3000);
      });
  }

  return (
    <section className="flex space-x-8">
      <div className="w-1/4">
        <button
          className={`block text-2xl text-left font-medium hover:text-red-600 duration-200 ${
            currentTab === "details" && "text-red-600 ml-2"
          }`}
          onClick={() => setCurrentTab("details")}
        >
          Основні деталі
        </button>
        <button
          className={`block text-2xl text-left font-medium hover:text-red-600 duration-200 ${
            currentTab === "challenges" && "text-red-600 ml-2"
          }`}
          onClick={() => setCurrentTab("challenges")}
        >
          Редактор викликів
        </button>
        <button
          className={`block text-2xl text-left font-medium hover:text-red-600 duration-200 ${
            currentTab === "actions" && "text-red-600 ml-2"
          }`}
          onClick={() => setCurrentTab("actions")}
        >
          Редактор дій
        </button>
        <button className="block text-2xl text-left font-medium hover:text-red-600 duration-200">
          Повернутися до попереднього меню
        </button>
      </div>

      <div className="w-2/4">
        <div
          id="success-notice"
          className="hidden items-center bg-green-200  text-sm font-medium px-4 py-3 rounded-md mb-4 border-green-500 text-green-500"
          role="alert"
        >
          <p>Program details updated successfully.</p>
        </div>

        <div
          id="error-notice"
          className="hidden items-center bg-red-200  text-sm font-medium px-4 py-3 rounded-md mb-4 border-red-500 text-red-500"
          role="alert"
        >
          <p>There was an error updating the program details.</p>
        </div>

        {currentTab === "details" && (
          <DetailsSection
            programDetails={programDetails}
            setProgramDetails={setProgramDetails}
          />
        )}

        {currentTab === "challenges" && (
          <ChallengesEditor
            programId={program.id}
            challenges={challenges}
            challengesList={challengesList}
            setChallenges={setChallengesList}
            setEditChallengeFormValues={setEditChallengeFormValues}
            setEditChallengeFormVisible={setEditChallengeFormVisible}
          />
        )}
        {currentTab === "actions" && <ActionsEditor />}
      </div>

      <div className="w-1/4">
        {editChallengeFormVisible && (
          <div className="bg-neutral-50 rounded-md border border-neutral-100 p-4 mb-4">
            <div className="mb-4">
              <label className="block text-gray-700 text-xs" htmlFor="name">
                Назва виклику
              </label>

              <input
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md text-sm"
                id="name"
                type="text"
                placeholder="Назва виклику"
                value={editChallengeFormValues.name}
                onChange={(e) =>
                  setEditChallengeFormValues({
                    ...editChallengeFormValues,
                    name: e.target.value,
                  })
                }
              />
            </div>

            <div className="mb-4">
              <label
                className="block text-gray-700 text-xs"
                htmlFor="description"
              >
                Опис виклику
              </label>

              <textarea
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md text-sm"
                id="description"
                type="text"
                placeholder="Опис виклику"
                value={editChallengeFormValues.description}
                onChange={(e) =>
                  setEditChallengeFormValues({
                    ...editChallengeFormValues,
                    description: e.target.value,
                  })
                }
              />
            </div>

            <div className="flex justify-between space-x-4">
              <button
                className="px-4 py-2 bg-red-100 text-red-700 hover:bg-red-50 duration-200 cursor-pointer rounded-md text-xs"
                onClick={() => setEditChallengeFormVisible(false)}
              >
                Скасувати
              </button>
              <button
                className="px-4 py-2 bg-neutral-100 text-neutral-700 hover:bg-neutral-50 duration-200 cursor-pointer rounded-md text-xs"
                onClick={(e) => {
                  handleChallengeUpdate(e);
                }}
              >
                Зберегти
              </button>
            </div>
          </div>
        )}
      </div>
    </section>
  );
}

export default Edit;
