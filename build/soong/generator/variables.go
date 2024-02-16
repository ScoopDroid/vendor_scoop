package generator

import (
	"fmt"

	"android/soong/android"
)

func scoopExpandVariables(ctx android.ModuleContext, in string) string {
	scoopVars := ctx.Config().VendorConfig("scoopVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if scoopVars.IsSet(name) {
			return scoopVars.String(name), nil
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
