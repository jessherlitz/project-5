//
//  AdventureController.swift
//  project-5
//
//  Created by Jessica Sampaio-Herlitz on 11/12/24.

import Foundation

protocol AdventureViewDelegate: AnyObject {
    func displayStage(description: String, options: [String], image: String)
    func displayEndOfAdventure(successMessage: String)
}

class AdventureController {
    weak var delegate: AdventureViewDelegate?
    private var currentStageIndex: Int = 0
    private let stages: [AdventureStage] = [
        AdventureStage(
              description: "You are a curious cat in a garden. You see a butterfly and a mysterious door.",
              options: ["Chase the butterfly", "Open the door"],
              outcomes: [1, 2],
              background: "main_background"
          ),
          AdventureStage(
              description: "You chase the butterfly and end up near a tree. You spot a dog approaching!",
              options: ["Climb the tree", "Run away"],
              outcomes: [3, 4],
              background: "background_1"
          ),
          AdventureStage(
              description: "The door leads to a cozy room with a warm blanket and some chicken on the counter.",
              options: ["Curl up on the blanket", "Jump on the counter"],
              outcomes: [10, 9],
              background: "background_2"
          ),
          AdventureStage(
              description: "You climbed the tree and saw some baby birds on a nest.",
              options: ["Attack the birds", "Nap on the tree"],
              outcomes: [5, 6],
              background: "background_3"
          ),
          AdventureStage(
              description: "You ran away, but got lost. You see a friendly human.",
              options: ["Walk up to human", "Ignore human"],
              outcomes: [7, 8],
              background: "background_4"
          ),
          AdventureStage(
              description: "You slide from the tree and you notice a mouse hole in the corner of the garden.",
              options: ["Investigate the hole", "Go back home"],
              outcomes: [11, 21],
              background: "background_3"
          ),
          AdventureStage(
              description: "You take a nap on the tree and safely return home later. Success!",
              options: [],
              outcomes: [],
              background: "background_6"
          ),
          AdventureStage(
              description: "Human gives you food and takes you back home to your owner. Success!",
              options: [],
              outcomes: [],
              background: "background_11"
          ),
          AdventureStage(
              description: "You need to find your own way home, which you'll eventually do. Fail!",
              options: [],
              outcomes: [],
              background: "background_12"
          ),
          AdventureStage(
              description: "You eat your chicken and see a toy outside.",
              options: ["Walk outside", "Stay inside"],
              outcomes: [18, 20],
              background: "background_11"
          ),
          AdventureStage(
              description: "You take a nap in the sun and then your human feeds you. Success!",
              options: [],
              outcomes: [],
              background: "background_6"
          ),
          AdventureStage(
              description: "You investigate the hole and find a family of mice.",
              options: ["Chase the mice", "Watch them quietly"],
              outcomes: [12, 13],
              background: "background_7"
          ),
          AdventureStage(
              description: "You chased the mice and ended up in a neighbor's yard.",
              options: ["Sneak back home", "Explore the yard"],
              outcomes: [21, 14],
              background: "background_8"
          ),
          AdventureStage(
              description: "You watch the mice quietly, and they start to trust you. Success!",
              options: [],
              outcomes: [],
              background: "background_8"
          ),
          AdventureStage(
              description: "In the neighbor's yard, you find a fish pond!",
              options: ["Try to catch a fish", "Just watch the fish"],
              outcomes: [15, 20],
              background: "background_10"
          ),
          AdventureStage(
              description: "You try to catch a fish but fall into the water! Fail!",
              options: [],
              outcomes: [],
              background: "background_9"
          ),
          AdventureStage(
              description: "You return to the garden, and your owner finds you with a treat. Success!",
              options: [],
              outcomes: [],
              background: "background_6"
          ),
          AdventureStage(
              description: "You discover a hidden path through the bushes leading to an open field.",
              options: ["Follow the path", "Stay in the garden"],
              outcomes: [16, 10],
              background: "background_13"
          ),
          AdventureStage(
              description: "Following the path, you reach a beautiful field filled with flowers and butterflies.",
              options: ["Chase the butterflies", "Relax in the sun"],
              outcomes: [17, 20],
              background: "background_13"
          ),
          AdventureStage(
              description: "You chase butterflies until you tire yourself out. Success!",
              options: [],
              outcomes: [],
              background: "background_13"
          ),
          AdventureStage(
              description: "You relax in the sun, enjoying a peaceful nap. Success!",
              options: [],
              outcomes: [],
              background: "background_6"
          ),
          AdventureStage(
              description: "You go back home and take a peaceful nap. Success!",
              options: [],
              outcomes: [],
              background: "background_6"
          )
    ]

    func startAdventure() {
        currentStageIndex = 0
        showCurrentStage()
    }
    
    func chooseOption(at index: Int) {
        guard index < stages[currentStageIndex].outcomes.count else { return }
        currentStageIndex = stages[currentStageIndex].outcomes[index]
        showCurrentStage()
    }
    
    func restartAdventure() {
        currentStageIndex = 0
        showCurrentStage()
    }
    
    private func showCurrentStage() {
        let stage = stages[currentStageIndex]
        
        if stage.options.isEmpty {
            delegate?.displayEndOfAdventure(successMessage: stage.description)
        } else {
            delegate?.displayStage(description: stage.description, options: stage.options, image: stage.background)
        }
    }
}
