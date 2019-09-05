package android

// Global config used by Beast soong additions
var BeastConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
		"org.beast.hardware",
	},
}
