//
//  CreateView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI

struct CreateView: View {
    
    @State private var cardItems: [CardItem] = CardItem.stubMultiple
    @State private var currentStep: CreateStep = .createStory(.childsName)
    
    // Child Name
    @State private var childName: String = ""
    
    // Duration
    @State private var selectedDuration: String? = ""
    let durationOptions = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    // Age
    @State private var selectedAge: String? = ""
    let ageOptions = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    // Gender
    @State private var selectedGender: String? = ""
    let genderOptions = ["Boy", "Girl", "Prefer not to say"]
    
    // Story Name
    @State private var storyName: String = ""
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Text(stepTitle(for: currentStep))
                        .font(.custom("Fredoka-SemiBold", size: 50))
                    Spacer()
                    Button("Skip", action: skip)
                        .buttonStyle(SecondaryButtonStyle())
                }
                .padding(.top, 100)
                if (stepShowsSubtitleAtTop(for: currentStep)) {
                    HStack {
                        Text(stepSubtitle(for: currentStep))
                            .font(.custom("SFProText-Regular", size: 24))
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 60)
            
            Spacer()
            stepView(for: currentStep)
            Spacer()
            
            HStack {
                Button("Cancel", action: cancel)
                    .buttonStyle(SecondaryButtonStyle())
                Button("Next", action: next)
                    .buttonStyle(PrimaryRoundedButtonStyle())
            }
            .padding(.bottom, 100)
        }
        .background(Color("FaibleBackground"))
    }
    
    func next() {
        
        //TODO: save current step
        
        // move to next step
        switch currentStep {
            case .createStory(.childsName):
                currentStep = .createStory(.duration)
            case .createStory(.duration):
                currentStep = .createStory(.age)
            case .createStory(.age):
                currentStep = .createStory(.gender)
            case .createStory(.gender):
                currentStep = .createStory(.storyName)
            case .createStory(.storyName):
                currentStep = .artStyle
            case .artStyle:
                currentStep = .characterStyle
            case .characterStyle:
                currentStep = .location
            case .location:
                currentStep = .moral
            break
            default:
                currentStep = .createStory(.childsName)
        }
    }
    
    func cancel() {
        
    }
    
    func skip() {
        
    }
    
    @ViewBuilder
    func stepView(for step: CreateStep) -> some View {
        switch step {
            
            case .createStory(.childsName):
            AnyView(InputView(header: stepSubtitle(for: currentStep)) {
                    TextField(
                            "Alex or Nathalia...",
                            text: $childName
                        )
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .font(.custom("SFProText-Regular", size: 48))
                })
            
            case .createStory(.duration):
                AnyView(InputView(header: stepSubtitle(for: currentStep)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        RadioButtonView(selectedOption: $selectedDuration, options: durationOptions, isHorizontal: true) { option in
                            NumberCardView(option: option, selectedOption: $selectedDuration)
                        }
                    }
                })
            
            case .createStory(.age):
                AnyView(InputView(header: stepSubtitle(for: currentStep)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        RadioButtonView(selectedOption: $selectedAge, options: ageOptions, isHorizontal: true) { option in
                            NumberCardView(option: option, selectedOption: $selectedAge)
                        }
                    }
                })
            
            case .createStory(.gender):
                AnyView(InputView(header: stepSubtitle(for: currentStep)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        RadioButtonView(selectedOption: $selectedGender, options: genderOptions, isHorizontal: true) { option in
                            NumberCardView(option: option, selectedOption: $selectedGender)
                        }
                    }
                })
            
            case .createStory(.storyName):
                AnyView(InputView(header: stepSubtitle(for: currentStep)) {
                        TextField(
                                "eg: Nat the hero of the jungle...",
                                text: $storyName
                            )
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .font(.custom("SFProText-Regular", size: 48))
                    })
            
            case .artStyle:
                AnyView(CardsCarousel(items: $cardItems))
            
            default:
                AnyView(Text("default"))
        }
    }

    func stepTitle(for step: CreateStep) -> String {
        switch step {
        case .createStory:
            return "CREATE A NEW STORY"
        case .artStyle:
            return "ART STYLE"
        case .characterStyle:
            return "CHARACTER STYLE"
        case .location:
            return "LOCATION"
        case .moral:
            return "MORAL OF THE STORY"
        }
    }
    
    func stepSubtitle(for step: CreateStep) -> String {
        switch step {
        case .createStory(.childsName):
            return "Your child's name:"
        case .createStory(.duration):
            return "Length of story (in minutes of reading time)"
        case .createStory(.age):
            return "Your child’s age:"
        case .createStory(.gender):
            return "Your child’s gender:"
        case .createStory(.storyName):
            return "Name your story (you can edit this later):"
        case .artStyle:
            return "Choose a popular visual style for your story:"
        case .characterStyle:
            return "Choose the type of characters that will appear in your story:"
        case .location:
            return "Choose a primary location for your story:"
        case .moral:
            return "Choose the lesson you want your story to teach:"
        }
    }
    
    func stepShowsSubtitleAtTop(for step: CreateStep) -> Bool {
        switch step {
        case .createStory(.childsName):
            return false
        case .createStory(.duration):
            return false
        case .createStory(.age):
            return false
        case .createStory(.gender):
            return false
        case .createStory(.storyName):
            return false
        case .artStyle:
            return true
        case .characterStyle:
            return true
        case .location:
            return true
        case .moral:
            return true
        }
    }
}

public enum CreateStep {
    case createStory(CreateStoryStep)
    case artStyle
    case characterStyle
    case location
    case moral
}

public enum CreateStoryStep {
    case childsName
    case duration
    case age
    case gender
    case storyName
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
