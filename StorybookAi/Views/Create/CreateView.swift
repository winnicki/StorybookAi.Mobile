//
//  CreateView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI
import RealmSwift
import SwiftBSON

struct CreateView: View {
    
    @EnvironmentObject private var realmApp: RealmSwift.App
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var artStyleItems: [CardItem] = CardItem.stubMultipleArtStyleItems
    @State private var characterStyleItems: [CardItem] = CardItem.stubMultipleCharacterStyleItems
    @State private var locationItems: [CardItem] = CardItem.stubMultipleLocationItems
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
    
    // Gender
    @State private var selectedMoral: String? = ""
    let moralOptions = ["Sharing", "Caring", "Courage", "Humility", "Respect", "Friendship", "Honesty"]
    
    // Story Name
    @State private var storyName: String = ""
    
    var body: some View {
        ZStack() {
            
            //ELLIPSE
            GeometryReader { geometry in
                Image("Ellipse")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height / 1.7, alignment: .top)
                    .clipped()
                    .ignoresSafeArea()
            }
            
            // HEADER AND FOOTER
            VStack {
                Group {
                    HStack {
                        Text(stepTitle(for: currentStep))
                            .font(.custom("Fredoka-SemiBold", size: 50))
                        Spacer()
                        Button("Skip", action: next)
                            .buttonStyle(SecondaryButtonStyle())
                    }
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

                HStack {
                    if (stepShowsCancelButton(for: currentStep)) {
                        Button("Cancel", action: cancel)
                            .buttonStyle(SecondaryButtonStyle())
                    }
                    else {
                        Button("Back", action: back)
                            .buttonStyle(SecondaryButtonStyle())
                    }
                    if (stepShowsCreateButton(for: currentStep)) {
                        Button("Create") {
                            Task {
                                await create()
                            }
                        }
                        .buttonStyle(PrimaryRoundedButtonStyle())
                    }
                    else {
                        Button("Next", action: next)
                            .buttonStyle(PrimaryRoundedButtonStyle())
                    }
                }
                .padding()
            }

            // CURRENT STEP
            stepView(for: currentStep)

        }
        .background(Color("FaibleLightBackground"))
    }
    
    func create() async {
        let user = realmApp.currentUser
        
        // Convert Swift strings to BSON strings
        let storyNameBSON = BSON.string(storyName)
        let selectedMoralBSON = BSON.string(selectedMoral!)
        let childNameBSON = BSON.string(childName)
        let selectedGenderBSON = BSON.string(selectedGender!)

        // Convert selectedDuration and selectedAge to Int32
        if let selectedDurationInt32 = Int32(selectedDuration!),
           let selectedAgeInt32 = Int32(selectedAge!) {

            // Create the BSONDocument with BSON values
            let storyDocument: BSONDocument = [
                "Title": storyNameBSON,
                "ArtStyle": "Cartoon",
                "CharacterStyle": "Boy",
                "Location": "New York City",
                "Moral": selectedMoralBSON,
                "ReadingDuration": BSON.int32(selectedDurationInt32),
                "Child": [
                    "Name": childNameBSON,
                    "Age": BSON.int32(selectedAgeInt32),
                    "Gender": selectedGenderBSON
                ]
            ]

            do {
                let result = try await user!.functions.CreateStory([AnyBSON(storyDocument.toExtendedJSONString())])
                print("Called function 'createstory' and got result: \(result)")
            } catch {
                print("Function call failed: \(error.localizedDescription)")
            }
        } else {
            // Handle the case where selectedDuration or selectedAge cannot be converted to Int32
            print("Error: selectedDuration or selectedAge cannot be converted to Int32")
        }
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
    
    func back() {
        
        //TODO: save current step
        
        // move to next step
        switch currentStep {
            case .createStory(.duration):
                currentStep = .createStory(.childsName)
            case .createStory(.age):
                currentStep = .createStory(.duration)
            case .createStory(.gender):
                currentStep = .createStory(.age)
            case .createStory(.storyName):
                currentStep = .createStory(.gender)
            case .artStyle:
                currentStep = .createStory(.storyName)
            case .characterStyle:
                currentStep = .artStyle
            case .location:
                currentStep = .characterStyle
            case .moral:
                currentStep = .location
            break
            default:
                currentStep = .createStory(.childsName)
        }
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
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
                AnyView(CardsCarousel(items: $artStyleItems))
            
            case .characterStyle:
                AnyView(CardsCarousel(items: $characterStyleItems))
            
            case .location:
                AnyView(CardsCarousel(items: $locationItems))
            
            case .moral:
                AnyView(InputView(header: stepSubtitle(for: currentStep)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        RadioButtonView(selectedOption: $selectedMoral, options: moralOptions, isHorizontal: true) { option in
                            NumberCardView(option: option, selectedOption: $selectedMoral)
                        }
                    }
                })
            
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
            return false
        }
    }
    
    func stepShowsCancelButton(for step: CreateStep) -> Bool {
        switch step {
        case .createStory(.childsName):
            return true
        default:
            return false
        }
    }
    
    func stepShowsCreateButton(for step: CreateStep) -> Bool {
        switch step {
        case .moral:
            return true
        default:
            return false
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
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad mini (6th generation)")
    }
}
