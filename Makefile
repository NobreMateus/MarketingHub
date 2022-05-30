create:
	@mkdir Modules/$(module)
	@mkdir Modules/$(module)/Source
	@mkdir Modules/$(module)/$(module)Tests
	@touch Modules/$(module)/Source/ViewController.swift
	@touch Modules/$(module)/$(module)Tests/$(module)Tests.swift
	@touch Modules/$(module)/Project.swift
	@echo "import ProjectDescription" >> Modules/$(module)/Project.swift
	@echo "import ProjectDescriptionHelpers" >> Modules/$(module)/Project.swift
	@echo "" >> Modules/$(module)/Project.swift
	@echo "let project = Project.createModule(name: \""$(module)"\")" >> Modules/$(module)/Project.swift

create_with_resources:
	@mkdir Modules/$(module)
	@mkdir Modules/$(module)/Source
	@mkdir Modules/$(module)/Resources
	@mkdir Modules/$(module)/$(module)Tests
	@touch Modules/$(module)/Project.swift
	@touch Modules/$(module)/Source/ViewController.swift
	@touch Modules/$(module)/Resources/Launchscreen.storyboard
	@touch Modules/$(module)/$(module)Tests/$(module)Tests.swift
	@echo "import ProjectDescription" >> Modules/$(module)/Project.swift
	@echo "import ProjectDescriptionHelpers" >> Modules/$(module)/Project.swift
	@echo "" >> Modules/$(module)/Project.swift
	@echo "let project = Project.createModuleWithResources(name: \""$(module)"\")" >> Modules/$(module)/Project.swift

