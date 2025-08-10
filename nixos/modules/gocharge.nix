{
	systemd = {
		timers."gocharge" = {
			wantedBy = [ "timers.target" ];
			timerConfig = {
				OnBootSec = "5m";
				OnUnitActiveSec = "5m";
				Unit = "gocharge.service";
			};
		};

		services."gocharge" = {
			script = "$HOME/.local/bin/gocharge";
			serviceConfig = {
				Type = "oneshot";
				User = "y";
			};
		};
	};
}
