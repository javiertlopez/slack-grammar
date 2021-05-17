const Slack = require('slack');
slack = Slack();

let channels = ["channel1", "channel2"];
const users = ["user1", "user2"];
channels.forEach(channel => {
slack.api('conversations.create', {
	is_private: true,
	name: channel
});
slack.api('conversations.invite', {
	channel: channel,
	users: users
});
slack.api('chat.postMessage', {
	channel: channel,
	text: "Hello everyone, welcome"
});
}
);
