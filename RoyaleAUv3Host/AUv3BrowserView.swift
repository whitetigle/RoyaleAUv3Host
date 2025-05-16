import SwiftUI
import AVFoundation
import CoreAudioKit

struct AudioComponent: Identifiable {
    let id = UUID()
    let component: AVAudioUnitComponent
    var name: String { "\(component.name) (\(component.manufacturerName))" }
}

class AudioUnitViewModel: ObservableObject {
    @Published var groupedByManufacturer: [String: [AudioComponent]] = [:]
    @Published var expandedManufacturers: Set<String> = []

    init() {
        loadAudioUnits()
    }

    func loadAudioUnits() {
        let all = AVAudioUnitComponentManager.shared().components(matching: AudioComponentDescription())
        let allAudioComponents = all.filter {
            let type = $0.audioComponentDescription.componentType
            return type == kAudioUnitType_Effect ||
                   type == kAudioUnitType_MusicDevice ||
                   type == kAudioUnitType_MIDIProcessor
        }.map { AudioComponent(component: $0) }

        groupedByManufacturer = Dictionary(grouping: allAudioComponents, by: { $0.component.manufacturerName })
    }
}


struct AudioUnitBrowserView: View {
    @StateObject var viewModel = AudioUnitViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("AUv3 Plugins currently installed on my device")
                            .font(.title)
                            .bold()
                            .padding(.horizontal)

                        ForEach(viewModel.groupedByManufacturer.sorted(by: { $0.key < $1.key }), id: \.key) { manufacturer, components in
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Image(systemName: viewModel.expandedManufacturers.contains(manufacturer) ? "minus.circle" : "plus.circle")
                                        .foregroundColor(.blue)
                                    Text("\(manufacturer) (\(components.count))")
                                        .font(.headline)
                                }
                                .padding(.horizontal)
                                .onTapGesture {
                                    if viewModel.expandedManufacturers.contains(manufacturer) {
                                        viewModel.expandedManufacturers.remove(manufacturer)
                                    } else {
                                        viewModel.expandedManufacturers.insert(manufacturer)
                                    }
                                }

                                if viewModel.expandedManufacturers.contains(manufacturer) {
                                    ForEach(components) { comp in
                                        HStack(spacing: 12) {
                                            Image(uiImage: comp.component.icon ?? UIImage())
                                                .resizable()
                                                .frame(width: 32, height: 32)
                                                .cornerRadius(4)
                                            Text(comp.name)
                                                .foregroundColor(.primary)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .padding(.leading, 36)
                                        .padding(.trailing)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                }
                .padding()
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
