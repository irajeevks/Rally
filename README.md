
# Rally Entry iOS App

An interactive SwiftUI-based iOS application designed to showcase rally events with a map view, an animated bottom sheet, and a detailed entry list.

## Features

### 1.Map View (Background)
- Displays the user's current location.
- Highlights the rally event location (e.g., **Kings Down Rally 2025**) with a custom callout.
- Fully interactable: users can **zoom** and **pan** the map.

### 2.Bottom Sheet (Interactive)
- **Default state**: partially open showing "Entry List", filter dropdowns, and summary.
- **Drag to expand**: smoothly transitions to a full-screen state (refer to Figma).
- **Snap behavior**: sticky snapping between partial and full states.
- Built using a `GeometryReader` and drag gestures with animation.

### 3.Entry List
- Scrollable list of rally entries with:
  - **Driver & Co-driver**: shown with circular initials avatar chips.
  - **Car details**: make, model, and team.
  - **Entry number** prominently displayed.
  - Placeholder `"TBD"` used when details are unavailable.
- Pixel-perfect layout matched to Figma spec.

### 4.Filters
- Static dropdown menus:
  - **Select Championship**
  - **Select Car Class**
- Used to filter the entry list.

### 5.Navigation & UI
- **Top Left**: Back navigation to previous screen.
- **Top Right**: Static points display (e.g., `2500 points earned`).
- **Bottom Tab Bar**:
  - Tabs with icons.
  - The second tab (Entry List) is highlighted.
  - Icons should reflect selected and unselected states.

## Project Structure (Xcode)

Rally/
├── Models/
│   └── RallyEntry.swift
├── Resources/
│   └── Fonts/
│       ├── AppFont.swift
│       ├── kuanari-bold.ttf
│       ├── kuanari-medium.ttf
│       ├── kuanari-regular.ttf
│       └── kuanari-thin.ttf
├── Views/
│   ├── Components/
│   │   ├── Buttons/
│   │   │   └── FilterButton.swift
│   │   ├── EntryList/
│   │   │   ├── EntryListItem.swift
│   │   │   ├── EntryListView.swift
│   │   │   ├── FilterDropdown.swift
│   │   │   └── InitialCircle.swift
│   │   ├── Headers/
│   │   │   ├── BottomSheetHeader.swift
│   │   │   ├── GlowingBackground.swift
│   │   │   └── NavigationBarView.swift
│   │   └── TabBar/
│   │       ├── AdditionalTabIns...ingViewModifier.swift
│   │       ├── AppTabBar.swift
│   │       ├── AppTabView.swift
│   │       ├── TabBarShape.swift
│   │       └── TabItemProvider.swift
│   └── Screens/
│       ├── RallyBottomSheet.swift
│       └── RallyMapView.swift
├── Assets.xcassets/
├── Info.plist
├── MainTabView.swift
├── RallyApp.swift
├── RallyTests/

## Requirements

- iOS 17+
- SwiftUI
- MapKit
- XCTests for UI validation

## Setup & Run

1. Clone the repo.
2. Open `Rally.xcodeproj` in Xcode.
3. Run on a physical device or simulator (iPhone 15 Pro recommended).
4. Modify `RallyMapView` and `RallyBottomSheet` to adjust layout or logic.
5. UI Tests available in `RallyUITests`.

## Notes

- Keep spacing, padding, and typography consistent with the Figma file.
- All UI elements and transitions should be **smooth**, **animated**, and **responsive**.
- Placeholder content (`TBD`) must remain in alignment with designed cards.

## ✨ Credits

Created by **Rajeev Singh**, 2025  
UI/UX based on Rally Championship App design (Figma reference included).

Note: Please refer to the attached image/video for visual reference and implementation details.
