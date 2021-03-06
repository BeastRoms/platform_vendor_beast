package android
type Product_variables struct {
	Needs_text_relocations struct {
		Cppflags []string
	}
	Target_process_sdk_version_override struct {
		Cppflags []string
	}
	Should_skip_waiting_for_qsee struct {
		Cflags []string
	}
	Device_support_hwfde struct {
		Cflags []string
		Header_libs []string
		Shared_libs []string
	}
	Device_support_hwfde_perf struct {
		Cflags []string
	}
	Device_support_legacy_hwfde struct {
		Cflags []string
	}
	Device_support_wait_for_qsee struct {
		Cflags []string
	}
	Target_shim_libs struct {
		Cppflags []string
	}
	Uses_generic_camera_parameter_library struct {
		Srcs []string
	}
	Uses_qcom_bsp_legacy struct {
		Cflags []string
		Cppflags []string
	}
	Uses_qti_camera_device struct {
		Cppflags []string
		Shared_libs []string
	}
	Uses_qcom_um_family struct {
		Cflags []string
		Srcs []string
	}
	Uses_qcom_um_3_18_family struct {
		Header_libs []string
		Shared_libs []string
	}
	Uses_qcom_um_4_4_family struct {
		Header_libs []string
		Shared_libs []string
	}
	Uses_qcom_um_4_9_family struct {
		Header_libs []string
		Shared_libs []string
	}
	Uses_qcom_um_4_14_family struct {
		Header_libs []string
		Shared_libs []string
	}
}

type ProductVariables struct {
	Should_skip_waiting_for_qsee  *bool `json:",omitempty"`
	Device_support_hwfde  *bool `json:",omitempty"`
	Device_support_hwfde_perf  *bool `json:",omitempty"`
	Device_support_legacy_hwfde  *bool `json:",omitempty"`
	Device_support_wait_for_qsee  *bool `json:",omitempty"`
	Java_Source_Overlays *string `json:",omitempty"`
	Needs_text_relocations  *bool `json:",omitempty"`
	Specific_camera_parameter_library  *string `json:",omitempty"`
	Target_process_sdk_version_override *string `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Uses_generic_camera_parameter_library  *bool `json:",omitempty"`
	Uses_qcom_bsp_legacy  *bool `json:",omitempty"`
	Uses_qti_camera_device  *bool `json:",omitempty"`
	Uses_qcom_um_family  							*bool `json:",omitempty"`
	Uses_qcom_um_3_18_family  						*bool `json:",omitempty"`
	Uses_qcom_um_4_4_family  						*bool `json:",omitempty"`
	Uses_qcom_um_4_9_family  						*bool `json:",omitempty"`
	Uses_qcom_um_4_14_family  						*bool `json:",omitempty"`
}
