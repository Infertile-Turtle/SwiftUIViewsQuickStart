//
//  ContentView.swift
//  SwiftUIViewsQuickStart
//
//  Created by Andrew Fairchild on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ParentView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//        TitleView()
//        Headerview()
//        Refactoring()
//        Layers()
//        Shapes()
//        ViewSizesPullIn()
//        ViewSizesPushOut()
        PreviewsIntro()
    }
}

struct ParentView: View {
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Text("Parent")
                    .font(.system(size: 50.0).bold())
                VStack {
                    RoundedRectangle(cornerSize: .init(width: 10, height: 10))
                        .padding()
                        .foregroundColor(.orange)
                        .overlay(content: {
                            Text("Child").font(.system(size: 25.0).bold())
                        })
                    VStack {
                        RoundedRectangle(cornerSize: .init(width: 10, height: 10))
                            .padding()
                            .foregroundColor(.orange)
                            .overlay(content: {
                                Text("Child").font(.system(size: 25.0).bold())
                            })
                    }
                }
            }
            .padding()
            .frame(height: 450, alignment: .center)
        }
        .ignoresSafeArea()
    }
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            Text("Subtitle")
                .font(.title)
                .foregroundColor(.gray)
            Text("Short description of what I am demonstrating goes here.")
                .font(.body)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
//                .padding()
                .background(Color.blue)
        }
    }
}

struct Headerview: View {
    var body: some View {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   desc: "Short description of what I am demonstrating goes here.",
                   back: .purple,
                   textColor: .white
        )
    }
}


struct HeaderView: View {
    @State var title: String
    @State var subtitle: String
    @State var desc: String
    @State var back: Color
    @State var textColor: Color
    var body: some View {
        VStack(spacing: 40) {
            Text(title)
                .font(.largeTitle)
            
            Text(subtitle)
                .font(.title)
                .foregroundColor(.gray)
            
            Text(desc)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(back)
                .font(.title)
        }
        
        
    }
}

struct Refactoring: View {
    var body: some View {
        VStack {
            HeaderView(title: "Refactoring", subtitle: "Reusing Modifiers", desc: "You can put common modifiers on the parent views to be applied to all the child views", back: .blue, textColor: .white)
            
            Image(systemName: "hand.thumbsup.fill")
                .font(.largeTitle)
            Image("SF Symbols")
                .resizable()
                .scaledToFit()
                  
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Layers: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView(title: "Layers", subtitle: "The Basics", desc: "With SwiftUI views, you can add layers on top (.overlay)and behind (.background) the view.", back: .blue, textColor: .white)
            
            Image("yosemite")
                .opacity(0.7)
                .background(Color.red.opacity(0.3))
                .background(Color.yellow.opacity(0.3))
                .background(Color.blue.opacity(0.3))
                .overlay(content: {
                    Text("Yosemite")
                })
            Image("Layers")
        }
        .font(.title)
    }
}

struct Shapes: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Shapes",subtitle: "Short Introduction",desc: "I'll make shapes, give them color and put htem behind other views just for decoration", back: .blue, textColor: .white)
            
            Text("This text has a rounded rectangle behind it")
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20) //Creates the shape
                              .foregroundColor(.blue)) // Makes the shape blue
            
            Text("But sometimes I'll use color and a corner radius:")
            
            Text("This text has a color with a corner radius")
                .foregroundColor(.white)
                .padding()
                .background(.blue) // Use a color as the background layer
                .cornerRadius(20)  // Rounded corners on the whole text view
        }
        .font(.title)
    }
}

struct ViewSizesPullIn: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Layout Behavior", subtitle: "Views that Pull In", desc: "Some views minimize their frame size so it is only as big as the content within it.", back: .purple, textColor: .white)
            
            Image(systemName: "arrow.down.to.line.alt")
            
            HStack { // Orders views horizontally
                Image(systemName: "arrow.right.to.line.alt")
                Text("Text views pull in")
                Image(systemName: "arrow.left.to.line.alt")
            }
            
            Image(systemName: "arrow.up.to.line.alt")
            
            Text("Pull-In views tend to center themselves within their parent container view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundColor(.white)
        }
        .font(.title)
    }
}

struct ViewSizesPushOut: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Layout Behavior", subtitle: "Views that Push Out", desc: "Some views will push out to fill up all available space within their parent.", back: .purple, textColor: .white)
            
            Color.purple // Colors are push out views
            // Add 5 layers on top of the color view
                .overlay(
                    Image(systemName: "arrow.up.left").padding(),
                    alignment: .topLeading)
                .overlay(
                    Image(systemName: "arrow.up.right").padding(),
                    alignment: .topTrailing)
                .overlay(
                    Image(systemName: "arrow.down.left").padding(),
                    alignment: .bottomLeading)
                .overlay(
                    Image(systemName: "arrow.down.right").padding(),
                    alignment: .bottomTrailing)
                .overlay(Text("Colors are Push-Out views"))
            
        }
        .font(.largeTitle)
    }
}

struct PreviewsIntro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Previews", subtitle: "Introduction", desc: "Xcode looks for a struct that conforms to the PreviewProvider protocol and accesses its previews property to display a view on the Convas.", back: .red, textColor: .white)
        }
    }
}

// Xcode looks for PreviewProvider struct
struct PreviewsIntroPreviews: PreviewProvider {
    // It will access this property to get a ciew to show in the Canvas (if the Canvas is shown)
    static var previews: some View {
        // Instantiate and return your view inside this property to see a preivew of it
        PreviewsIntro()
    }
}

struct PreviewsDarkMode: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Previews", subtitle: "Dark Mode", desc: "By default, your preview will show in light mode. To see it in dark mode, you can use the environment modifier.", back: .red, textColor: .white)
        }
    }
}


struct PreviewsDarkModePreviews: PreviewProvider {
    static var previews: some View {
        PreviewsDarkMode()
            .preferredColorScheme(.dark)
    }
}

struct PreviewLightAndDarkMode: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Previews", subtitle: "Light and Dark Modes Together", desc: "Group your views to preview more than one at a time", back: .red, textColor: .white)
        }
    }
}

struct PreviewsLightAndDarkModePreviews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewLightAndDarkMode() // Light Mode
            PreviewLightAndDarkMode()
                .preferredColorScheme(.dark)
        }
    }
}

struct PreviewDevices: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Previews", subtitle: "Change Devices", desc: "By default, your canvas will use the simulator you currently have selected (upper left in Xcode). You can preview a different device using the previewDevice modifier.", back: .red, textColor: .white)
        }
        .font(.title)
    }
}

struct PreviewDevicesPreviews: PreviewProvider {
    static var previews: some View {
        PreviewDevices()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
    }
}

struct PreviewSizeCategory: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Previews", subtitle: "Size Category (Accessibility Text Size)", desc: "For testing accessibility text size, set the sizeCategory property", back: .red, textColor: .white)
        }
        .font(.title)
    }
}

struct PreviewSizeCategoryPreviews: PreviewProvider {
    static var previews: some View {
        PreviewSizeCategory()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        /*
         Options:
         case accessibilityExtraExtraExtraLarge
         case accessibilityExtraExtraLarge
         case accessibilityExtraLarge
         case accessibilityLarge
         case accessibilityMedium
         case extraExtraExtraLarge
         case extraExtraLarge
         case extraLarge
         case extraSmall
         case large
         case medium
         case small
         */
    }
}

struct PreviewInterfaceOrientation: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Previews", subtitle: "Preview Interface Orientation", desc: "Use previewInterfaceOrientation to change your preview to landscape mode (left or right).", back: .brown, textColor: .white)
        }
        .font(.title)
    }
}

struct PreviewInterfaceOrientationPreviews: PreviewProvider {
    static var previews: some View {
        PreviewInterfaceOrientation()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct VStackIntro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "VStack", subtitle: "Introduction", desc: "A VStack will vertically arrange other views within it.", back: .blue, textColor: .white)
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
        }
        .font(.title)
    }
}

struct PreviewVStackIntroPreviews: PreviewProvider {
    static var previews: some View {
        VStackIntro()
    }
}

struct VStackNesting: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "VStack", subtitle: "Nesting", desc: "A VStack can be nested within another VStack when laying out views.", back: .blue, textColor: .white)
            VStack {
                Text("VStack inside another VStack")
                Divider()
                Text("This can be helpful. Why?")
                Divider()
                Text("More than 10 views creates an error.")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue))
            .padding()
            .foregroundColor(.white)
            
        }
        .font(.title)
    }
}

struct PreviewVStackNestingPreviews: PreviewProvider {
    static var previews: some View {
        VStackNesting()
    }
}


struct VStackSpacingIntro: View {
    var body: some View {
        VStack(spacing: 80) {
            HeaderView(title: "VStack", subtitle: "Spacing", desc: "The VStack initializer allows you to set the spacing between all the views inside the VStack", back: .blue, textColor: .white)
            
            Image(systemName: "arrow.up.and.down.circle.fill")
                .font(.largeTitle)
            
            Text("The spacing here between all views is 80.")
                .font(.title)
            
        }
    }
}

struct PreviewVStackSpacingPreviews: PreviewProvider {
    static var previews: some View {
        VStackSpacingIntro()
    }
}


struct VStackAlignmentIntro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "VStack", subtitle: "Alignment", desc: "By default, views in VStack are center aligned.", back: .blue, textColor: .white)
            
            VStack(alignment: .leading, spacing: 40) {
                Text("Leading Alignment")
                Divider()
                Image(systemName: "arrow.left")
            }
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue))
            .padding()
            
            VStack(alignment: .trailing, spacing: 40) {
                Text("Trailing Alignment")
                Divider()
                Image(systemName: "arrow.right")
            }
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue))
            .padding()
        }
    }
}

struct PreviewVStackAlignmentPreviews: PreviewProvider {
    static var previews: some View {
        VStackAlignmentIntro()
    }
}

struct LazyVStackIntro: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(title: "Lazy VStack", subtitle: "Introduction", desc: "When using the lazy VStack by itself, you won't notice much of a difference from the VStack.", back: .yellow, textColor: .black)
                .layoutPriority(1)
            
            Text("Lazy VStack")
            
            LazyVStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("VStack")
            VStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Notice the Lazy VStack pushes out horizontally. No spacers being used here.").background(Color.yellow)
        }
        .font(.title)
    }
}

struct PreviewLazyVStackIntroPreviews: PreviewProvider {
    static var previews: some View {
        LazyVStackIntro()
    }
}


struct LazyVStack_WithScrolling: View {
    @State private var teams = DataS.getTeams()
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(title: "LazyVStack", subtitle: "With ScrollView", desc: "The LazyVStack is best used with many views that scroll off the screen. \"Lazy\" means views off the screen are not created unless shown. This increases performance.", back: Color("GoldColor"), textColor: .white)
            
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(teams) { team in
                        Section {
                            ForEach(team.people) { person in
                                Image("\(person.imageName)")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            }
                        } header: {
                            TeamVerticalHeaderView(team: team)
                        } footer: {
                            TeamVerticalFooterView(team: team)
                        }
                    }
                }
            }
            Spacer()
        }
        .font(.title)
    }
}

struct LazyVStack_WithScrolling_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_WithScrolling()
    }
}

struct TeamVerticalHeaderView: View {
    var team: DataS.Team
    
    var body: some View {
        HStack {
            Text("Team")
                .font(.largeTitle)
            Image(systemName: team.imageName)
                .font(.largeTitle)
        }
        .frame(width: 300, height: 75)
        .background(Rectangle()
                        .fill(Color.yellow)
                        .opacity(0.9))
    }
}

struct TeamVerticalFooterView: View {
    var team: DataS.Team
    
    var body: some View {
        HStack {
            Text("Team Total: ")
                .font(.title)
            Text("\(team.people.count)")
                .font(.title)
                .fontWeight(.bold)
        }
        .frame(width: 300, height: 50)
        .background(Rectangle()
                        .fill(Color.yellow)
                        .opacity(0.9))
    }
}
