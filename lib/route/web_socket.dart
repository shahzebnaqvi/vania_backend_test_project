import 'package:vania/vania.dart';
import 'package:test_vania_backend/app/http/controllers/ws/chat_web_socket_controller.dart';

class WebSocketRoute implements Route {
  @override
  void register() {
    Router.websocket('/ws', (WebSocketEvent event) {
      event.on('message', chatController.newMessage);
    });
  }
}
