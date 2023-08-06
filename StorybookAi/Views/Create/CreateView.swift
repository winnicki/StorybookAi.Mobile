//
//  CreateView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-04-07.
//

import SwiftUI

struct CreateView: View {
    
    @State private var items: [CardItem] = CardItem.stubMultiple
    @State private var currentStep: CreateStep = .artStyle
    
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
                HStack {
                    Text(stepSubtitle(for: currentStep))
                        .font(.custom("SFProText-Regular", size: 24))
                    Spacer()
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
    }
    
    func cancel() {
        
    }
    
    func skip() {
        
    }
    
    @ViewBuilder
    func stepView(for step: CreateStep) -> some View {
        switch step {
            case .createStory(.childsName):
                return AnyView(NameInput())
            case .artStyle:
                return AnyView(CardsCarousel(items: $items))
            default:
                return AnyView(Text("default"))
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
