import json
from channels.generic.websocket import AsyncWebsocketConsumer


class NotificationConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        print('connected')
        self.group_name = 'notification'

        # join to group
        await self.channel_layer.group_add(self.group_name, self.channel_name)

        await self.accept()

        self.send(text_data=json.dumps({
            'type': 'connection_established',
            'message': 'You are now connected',
        }))

    async def disconnect(self):
        await self.channel_layer.group_discard(self.group_name,
                                               self.channel_name)

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json["message"]

        event = {
            'type': 'send_message',
            'message': message
        }

        # send message to group
        await self.channel_layer.group_send(self.group_name, event)

    # Receive message from group
    async def send_message(self, event):
        message = event['message']

        # send message to websocket
        await self.send(text_data=json.dumps({'message' : message}))
