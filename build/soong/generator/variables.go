package generator

import (
	"fmt"

	"android/soong/android"
)

func beastExpandVariables(ctx android.ModuleContext, in string) string {
	beastVars := ctx.Config().VendorConfig("beastVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if beastVars.IsSet(name) {
			return beastVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
