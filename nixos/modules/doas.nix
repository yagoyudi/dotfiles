{
	security = {
		sudo = {
			enable = false;
			wheelNeedsPassword = false;
		};

		doas = {
			enable = true;
			extraRules = [
				{
					users = [
						"y"
					];
					keepEnv = true;
					noPass = true;
				}
			];
		};
	};
}
