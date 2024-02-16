SCOOP_TARGET_PACKAGE := $(PRODUCT_OUT)/ScoopDroid-$(SCOOP_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: scoop bacon
scoop: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(SCOOP_TARGET_PACKAGE)
	$(hide) $(SHA256) $(SCOOP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(SCOOP_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/scoop/tools/generate_json_build_info.sh $(SCOOP_TARGET_PACKAGE)
	$(hide) rm -rf $(call intermediates-dir-for,PACKAGING,target_files)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}ScoopDroid ${txtrst}";
	@echo -e ""
	@echo -e "███████████████████████████████████"
	@echo -e "██                               ██"
	@echo -e "██      ┏┓       ┳┓    • ┓       ██"
	@echo -e "██      ┗┓┏┏┓┏┓┏┓┃┃┏┓┏┓┓┏┫       ██"
	@echo -e "██      ┗┛┗┗┛┗┛┣┛┻┛┛ ┗┛┗┗┻       ██"
	@echo -e "██             ┛                 ██"
	@echo -e "██╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼██"
	@echo -e "██        ◕ 𝓰𝓮𝓽 𝓪 𝓼𝓬𝓸𝓸𝓹 ◕        ██"
	@echo -e "██╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼██"
	@echo -e "███████████████████████████████████"
	@echo -e "██   Based on DerpFest-AOSP 14   ██"
	@echo -e "███████████████████████████████████"
	@echo -e "██ ➤ Package: "$(SCOOP_TARGET_PACKAGE)
	@echo -e "██ ➤ SHA256: `cat $(SCOOP_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1`"
	@echo -e "██ ➤ Size: `ls -lah $(SCOOP_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e "███████████████████████████████████"

bacon: scoop
