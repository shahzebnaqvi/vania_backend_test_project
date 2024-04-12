import 'package:vania/vania.dart';
import 'package:test_vania_backend/app/http/controllers/home_controller.dart';
import 'package:test_vania_backend/app/http/middleware/authenticate.dart';
import 'package:test_vania_backend/app/http/middleware/home_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/home", homeController.index);

    Router.get("/hello-world", () {
      return Response.html('Hello World');
    }).middleware([HomeMiddleware()]);

    // Return Authenticated user data
    Router.get("/user", () {
      return Response.json(Auth().user());
    }).middleware([AuthenticateMiddleware()]);
  }
}
