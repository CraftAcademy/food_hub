App.notifications = App.cable.subscriptions.create({
    channel: "WebNotificationsChannel"
}, {
        container() {
            const container = document.getElementById('notifications');
            return container;
        },

        connected() {
            // Called when the subscription is ready for use on the server
            console.log('Connected to websocket server ');
        },

        disconnected() {
            // Called when the subscription has been terminated by the server
            // Display the connection has been lost message
            this.container().innerHTML = '<p>Disconneced from server</p>'
            setTimeout(() => {
                this.container().innerHTML = '';
            }, 3000);
            console.log('Disconneced');
        },

        received(data) {
            // Create an element that will hold the message
            let node = document.createElement('p');
            node.innerHTML = data.message;
            // Append the message to the element
            this.container().appendChild(node)

            setTimeout(() => {
                // Remove the node after 3 seconds
                this.container().removeChild(node);
            }, 3000);
        },

    }
);
