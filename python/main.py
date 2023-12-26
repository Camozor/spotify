from pynvim import attach
import os

nvim = attach('socket', path=os.environ['NVIM_SOCKET'])
nvim.command('echo "Hello from python!!"')

# from dbus_next.aio import MessageBus
#
# import asyncio
#
# loop = asyncio.get_event_loop()
#
#
# async def main():
#     # nvim = attach('socket', '/run/user/1000/nvim.178061.0')
#     # nvim.command('echo "Hello from python!!"')
#
#     bus = await MessageBus().connect()
#     # the introspection xml would normally be included in your project, but
#     # this is convenient for development
#     introspection = await bus.introspect('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')
#
#     obj = bus.get_proxy_object('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2', introspection)
#     player = obj.get_interface('org.mpris.MediaPlayer2.Player')
#     properties = obj.get_interface('org.freedesktop.DBus.Properties')
#
#     # def on_properties_changed(interface_name, changed_properties, invalidated_properties):
#     #     for changed, variant in changed_properties.items():
#     # properties.on_properties_changed(on_properties_changed)
#
#     nvim.command('echo "Hello from python!!"')
#     await loop.create_future()
#
# loop.run_until_complete(main())
